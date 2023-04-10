FROM node:18-alpine3.15

# Install system packages
RUN apk add --update --no-cache supervisor mariadb mariadb-client gcc musl-dev curl

# Setup application
RUN mkdir -p /app

# Add application
WORKDIR /app
COPY challenge .

# Install dependencies
RUN npm install --legacy-peer-deps

# Setup superivsord
COPY config/supervisord.conf /etc/supervisord.conf

# Expose the port node-js is reachable on
EXPOSE 1337

# Populate database and start supervisord
COPY --chown=root entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
