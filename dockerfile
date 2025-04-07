# Use an alpine image
FROM alpine:3.21.3

# Set environment variables for Node.js and Yarn versions
ENV NODE_VERSION=22.14.0
ENV YARN_VERSION=4.5.0
ENV NVM_DIR=/root/.nvm

# Install necessary packages and NVM
# Install prerequisites
RUN apk update && \
    apk upgrade --no-cache && \
    apk add nodejs npm
    
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | sh && \
#     /bin/sh -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION" && \
#     /bin/sh -c "source $NVM_DIR/nvm.sh && nvm use $NODE_VERSION" && \
#     /bin/sh -c "source $NVM_DIR/nvm.sh && nvm alias default $NODE_VERSION"

# ENV PATH="$NVM_DIR/versions/node/v$NODE_VERSION/bin:$NVM_DIR:$PATH"

# Install Yarn using Corepack
RUN npm install -g corepack && corepack enable && corepack prepare yarn@$YARN_VERSION --activate

# Verify installations
RUN node -v && npm -v && yarn -v
