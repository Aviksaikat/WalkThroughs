FROM python:3.8.14-buster

# Install packages
RUN apt-get update \
    && apt-get install -y supervisor gnupg sqlite3 libcurl4-openssl-dev python3-dev python3-pycurl psmisc redis gcc \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python -m pip install --upgrade pip

# Copy flag
COPY flag.txt /root/flag

# Setup app
RUN mkdir -p /app

# Switch working environment
WORKDIR /app

# Add application
COPY challenge .
RUN chown -R www-data:www-data /app/flask_session

# Install dependencies
RUN pip install -r /app/requirements.txt

# Setup config
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/redis.conf /etc/redis/redis.conf
COPY config/readflag.c /

# Setup flag reader
RUN gcc -o /readflag /readflag.c && chmod 4755 /readflag && rm /readflag.c

# Expose port the server is reachable on
EXPOSE 1337

# Disable pycache
ENV PYTHONDONTWRITEBYTECODE=1

# Run supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]