FROM n8nio/n8n:latest

USER root

RUN npm install -g axios cheerio marked

# Install Playwright + browsers
RUN npm install -g n8n-nodes-playwright \
 && npx playwright install --with-deps

USER node
