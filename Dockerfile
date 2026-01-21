FROM n8nio/n8n:latest

USER root

# Install npm packages
RUN npm install -g axios cheerio marked

# Install Playwright packages
RUN npm install -g playwright n8n-nodes-playwright

# Install Playwright browsers and system dependencies
RUN npx playwright install --with-deps chromium

USER node
