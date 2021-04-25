FROM node:alpine

# Install packages
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk add --update --no-cache supervisor mongodb

# Setup app
RUN mkdir -p /app

# Add application
WORKDIR /app
COPY challenge .

# Install dependencies
RUN yarn

# Setup superivsord
COPY config/supervisord.conf /etc/supervisord.conf

# Expose the port node-js is reachable on
EXPOSE 80

COPY entrypoint.sh /entrypoint.sh

# Start the node-js application
ENTRYPOINT /entrypoint.sh