# Use the official Verdaccio image as the base
FROM verdaccio/verdaccio:6

# Set environment variables for security
ENV VERDACCIO_PORT=4873
ENV JWT_SECRET=your-secure-jwt-secret-change-me-in-production

# Install dependencies for htpasswd
USER root
RUN npm install -g htpasswd

# Create directories for configuration, storage, and certificates
RUN mkdir -p /verdaccio/conf /verdaccio/storage/data

# Copy configuration file
COPY config.yaml /verdaccio/conf/config.yaml

# Create htpasswd file with admin and ci-user accounts
# Passwords are examples; replace with secure passwords
RUN htpasswd -bc /verdaccio/conf/htpasswd admin adminSecurePassword123 && \
    htpasswd -b /verdaccio/conf/htpasswd ci-user ciSecurePassword456

# Set permissions for Verdaccio user
RUN chown -R 10001:10001 /verdaccio/storage /verdaccio/conf

# Switch back to Verdaccio user
USER 10001

# Expose the Verdaccio port
EXPOSE 4873

# Set the storage and configuration volumes
VOLUME ["/verdaccio/storage", "/verdaccio/conf"]

# Start Verdaccio
CMD ["verdaccio", "--config", "/verdaccio/conf/config.yaml"]