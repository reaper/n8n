# n8n Custom Docker Image

A custom Docker image based on [n8n](https://n8n.io/) with additional npm packages pre-installed for enhanced functionality.

## Features

This custom n8n image includes the following additional packages:

- **axios** - Promise-based HTTP client for making API requests
- **cheerio** - Fast, flexible web scraping library
- **marked** - Markdown parser and compiler
- **n8n-nodes-playwright** - Playwright nodes for browser automation
- **Playwright** - Browser automation with full dependencies

## Quick Start

### Using Docker

Pull and run the pre-built image from GitHub Container Registry:

```bash
docker pull ghcr.io/reaper/n8n:latest
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  ghcr.io/reaper/n8n:latest
```

### Using Docker Compose

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  n8n:
    image: ghcr.io/reaper/n8n:latest
    container_name: n8n
    restart: unless-stopped
    ports:
      - "5678:5678"
    volumes:
      - ~/.n8n:/home/node/.n8n
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=changeme
```

Then run:

```bash
docker-compose up -d
```

Access n8n at http://localhost:5678

## Building Locally

To build the image locally:

```bash
docker build -t n8n-custom .
```

Run the locally built image:

```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8n-custom
```

## Automated Builds

This repository uses GitHub Actions to automatically build and push Docker images:

- **Schedule**: Builds run every Sunday at 00:00 UTC
- **Manual**: Can be triggered manually via workflow dispatch
- **Platforms**: Supports both `linux/amd64` and `linux/arm64`
- **Registry**: Images are published to GitHub Container Registry (ghcr.io)

## Environment Variables

n8n supports various environment variables for configuration. Common ones include:

- `N8N_BASIC_AUTH_ACTIVE` - Enable/disable basic authentication
- `N8N_BASIC_AUTH_USER` - Basic auth username
- `N8N_BASIC_AUTH_PASSWORD` - Basic auth password
- `N8N_HOST` - Host name for n8n
- `N8N_PORT` - Port for n8n (default: 5678)
- `N8N_PROTOCOL` - Protocol to use (http/https)
- `WEBHOOK_URL` - URL for webhook calls

For a complete list of configuration options, see the [official n8n documentation](https://docs.n8n.io/hosting/configuration/).

## Data Persistence

To persist your n8n data, workflows, and credentials, mount a volume to `/home/node/.n8n`:

```bash
-v /path/to/your/data:/home/node/.n8n
```

## License

This custom image is based on n8n, which is available under the [Sustainable Use License](https://github.com/n8n-io/n8n/blob/master/LICENSE.md).

## Links

- [n8n Official Website](https://n8n.io/)
- [n8n Documentation](https://docs.n8n.io/)
- [n8n GitHub Repository](https://github.com/n8n-io/n8n)
- [Playwright Documentation](https://playwright.dev/)
