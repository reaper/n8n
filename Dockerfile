FROM n8nio/n8n:latest

USER root

# Install npm packages
RUN npm install -g axios cheerio marked

# Install Playwright system dependencies for Alpine
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto-emoji

# Install Playwright packages and browsers
RUN npm install -g playwright \
 && PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install -g n8n-nodes-playwright n8n-playwright

# Set Playwright to use system Chromium
ENV PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

USER node
