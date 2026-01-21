FROM n8nio/n8n

USER root
RUN npm install -g axios cheerio marked n8n-nodes-playwright
RUN npx playwright install --with-deps

USER node
