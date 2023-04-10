FROM node:alpine

# Install system packages
RUN apk add --update --no-cache supervisor

# Setup app
RUN mkdir -p /app

# Add application
WORKDIR /app
COPY challenge .

# Copy flag
COPY flag.txt /flag.txt

# Install dependencies
RUN yarn

# Setup superivsord
COPY config/supervisord.conf /etc/supervisord.conf

# Expose the port node-js is reachable on
EXPOSE 1337

# Start the node-js application
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]