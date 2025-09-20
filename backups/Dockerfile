# Use the official Verdaccio image as the base
FROM verdaccio/verdaccio:6

# Set environment variables for security
ENV VERDACCIO_PROTOCOL=https
ENV VERDACCIO_PORT=4873
ENV JWT_SECRET=your-secure-jwt-secret-change-me

# Install dependencies for htpasswd
USER root
RUN npm install -g htpasswd

# Create directories for configuration, storage, and certificates
RUN mkdir -p /verdaccio/conf /verdaccio/storage/data /verdaccio/certs

# Copy configuration file
COPY config.yaml /verdaccio/conf/config.yaml

# Copy or generate SSL certificates (self-signed for example purposes)
# In production, replace with your own certificates (e.g., from Let's Encrypt)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /verdaccio/certs/private.key \
    -out /verdaccio/certs/certificate.crt \
    -subj "/CN=verdaccio.mycomp.com" && \
    openssl x509 -in /verdaccio/certs/certificate.crt -out /verdaccio/certs/ca.crt -outform PEM

# Create htpasswd file with admin and ci-user accounts
# Passwords are examples; replace with secure passwords
RUN htpasswd -bc /verdaccio/conf/htpasswd admin adminSecurePassword123 && \
    htpasswd -b /verdaccio/conf/htpasswd ci-user ciSecurePassword456

# Set permissions for Verdaccio user
RUN chown -R 10001:10001 /verdaccio/storage /verdaccio/conf /verdaccio/certs

# Switch back to Verdaccio user
USER verdaccio

# Expose the Verdaccio port
EXPOSE 4873

# Set the storage and configuration volumes
VOLUME ["/verdaccio/storage", "/verdaccio/conf"]

# Start Verdaccio
CMD ["verdaccio", "--config", "/verdaccio/conf/config.yaml"]