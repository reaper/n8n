FROM n8nio/n8n:latest

USER root

# Install npm packages
RUN npm install -g axios cheerio marked

# Install Playwright packages and browsers
RUN npm install -g playwright \
 && npx playwright install --with-deps \
 && npm install -g n8n-nodes-playwright n8n-playwright

USER node
