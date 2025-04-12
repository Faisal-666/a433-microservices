FROM node:14.21-alpine
WORKDIR /app
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /bin/wait-for-it.sh
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3001
CMD ["/bin/wait-for-it.sh", "rabbitmq-service:5672", "--", "node","index.js"]
