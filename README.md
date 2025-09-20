# NPM Private Registry

A private npm registry setup using Verdaccio, providing a secure and efficient way to host private npm packages.

## Features

- Private npm package hosting
- Proxy support for public npm registry
- User authentication and authorization
- Docker containerization support
- Custom configuration for enterprise use

## Project Structure

```
├── config.yaml       # Verdaccio configuration
├── Dockerfile         # Docker container configuration
├── cmd               # Command scripts
├── backups/          # Configuration backups
│   ├── config.yaml
│   └── Dockerfile
└── README.md
```

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- Docker (optional, for containerized deployment)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/vinodsantharam/npm-private-registry.git
cd npm-private-registry
```

2. Install Verdaccio:
```bash
npm install -g verdaccio
```

3. Start the registry:
```bash
verdaccio --config config.yaml
```

### Docker Deployment

Build and run the Docker container:

```bash
docker build -t npm-private-registry .
docker run -p 4873:4873 npm-private-registry
```

## Configuration

The main configuration is stored in `config.yaml`. Key settings include:

- **Storage**: Local package storage configuration
- **Authentication**: User management and authentication methods
- **Uplinks**: Proxy settings for public npm registry
- **Security**: Access control and package publishing permissions

## Usage

### Setting up npm client

Point your npm client to use the private registry:

```bash
npm set registry http://localhost:4873
```

### Publishing packages

```bash
npm adduser --registry http://localhost:4873
npm publish --registry http://localhost:4873
```

### Installing packages

```bash
npm install package-name --registry http://localhost:4873
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test your changes
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For issues and questions, please open an issue on GitHub. 