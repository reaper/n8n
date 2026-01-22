FROM n8nio/n8n:latest

USER root

# Install npm packages
RUN npm install -g axios cheerio marked puppeteer-core

USER node
