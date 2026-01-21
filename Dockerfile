FROM n8nio/n8n:latest

USER root

# Install npm packages
RUN npm install -g axios cheerio marked

RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ca-certificates \
  ttf-freefont

USER node
