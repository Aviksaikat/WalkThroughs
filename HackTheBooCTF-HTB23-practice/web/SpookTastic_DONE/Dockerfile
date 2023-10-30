FROM python:3.11-alpine

# Setup usr
RUN adduser -D -u 1000 -g 1000 -s /bin/sh www

# Install dependencies
RUN apk add --update --no-cache gcc g++ make openssl-dev

# Install packages
RUN apk add --update --no-cache supervisor chromium chromium-chromedriver

# Upgrade pip
RUN python -m pip install --upgrade pip

# Setup app
RUN mkdir -p /app

# Switch working environment
WORKDIR /app

# Add application
COPY challenge .

# Install dependencies
RUN python -m venv venv
RUN . /app/venv/bin/activate && pip install -r requirements.txt

# Copy configs
COPY config/supervisord.conf /etc/supervisord.conf

# Expose port the server is reachable on
EXPOSE 1337

# Disable pycache
ENV PYTHONDONTWRITEBYTECODE=1

# Run supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]