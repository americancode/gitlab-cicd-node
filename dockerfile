FROM alpine:3.21.3

# Set environment variables for Node.js and Yarn versions
ENV NODE_VERSION=22.14.0
ENV YARN_VERSION=4.5.0
ENV NVM_DIR=/root/.nvm

# Install necessary packages and NVM
# Install prerequisites
RUN apk update && \
    apk upgrade --no-cache && \
    apk add nodejs npm ca-certificates

# Install Yarn using Corepack
RUN npm install -g corepack && corepack enable && corepack prepare yarn@$YARN_VERSION --activate

# Verify installations
RUN node -v && npm -v && yarn -v
