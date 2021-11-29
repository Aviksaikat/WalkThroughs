FROM python:3.7-alpine

# Install packages
RUN apk add --update --no-cache chromium chromium-chromedriver supervisor

# Upgrade pip
RUN python -m pip install --upgrade pip

# Install Dependencies
RUN pip install Flask selenium

# Setup app
RUN mkdir -p /app

# Add application
WORKDIR /app
COPY challenge .

# Setup supervisor
COPY config/supervisord.conf /etc/supervisord.conf

# Expose the port the application is reachable on
EXPOSE 1337

# Run supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]