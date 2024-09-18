# Use an official Ubuntu base image
FROM ubuntu:24.04

# Set environment variables for Node.js and Yarn versions
ENV NODE_VERSION=20.x
ENV YARN_VERSION=3.8.5

# Install necessary packages and Node.js
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs && \
    rm nodesource_setup.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Corepack and Yarn
RUN corepack enable && \
    corepack prepare yarn@${YARN_VERSION} --activate

# Verify installations
RUN node -v && npm -v && yarn -v