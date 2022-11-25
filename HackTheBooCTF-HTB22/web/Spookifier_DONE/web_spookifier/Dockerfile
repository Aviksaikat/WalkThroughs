FROM python:3.8-alpine

RUN apk add --no-cache --update supervisor gcc
# Upgrade pip
RUN python -m pip install --upgrade pip

# Install dependencies
RUN pip install Flask==2.0.0 mako flask_mako Werkzeug==2.0.0

# Copy flag
COPY flag.txt /flag.txt

# Setup app
RUN mkdir -p /app

# Switch working environment
WORKDIR /app

# Add application
COPY challenge .

# Setup supervisor
COPY config/supervisord.conf /etc/supervisord.conf

# Expose port the server is reachable on
EXPOSE 1337

# Disable pycache
ENV PYTHONDONTWRITEBYTECODE=1

# start supervisord
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]