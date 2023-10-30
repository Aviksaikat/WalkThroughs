# Use an Ubuntu-based Python image
FROM python:3.8

RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc |  gpg --dearmor | tee /usr/share/keyrings/mongodb.gpg > /dev/null
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update the base image again and install MongoDB
RUN apt-get update && \
    apt-get install -y mongodb-org supervisor && \
    apt-get clean

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Set permissions for the MongoDB data directory
RUN chown -R mongodb:mongodb /data/db

# Set environment variables for MongoDB
ENV MONGO_URI mongodb://127.0.0.1:27017/candyvault

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY challenge /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Setup superivsor
COPY conf/supervisord.conf /etc/supervisord.conf

# Expose port 1337 for the Flask app
EXPOSE 1337

# Start supervisor
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]