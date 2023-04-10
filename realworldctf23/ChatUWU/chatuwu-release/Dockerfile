FROM node:alpine
COPY ./src /app
WORKDIR /app
RUN npm ci --only=production

EXPOSE 1337
CMD node index.js
