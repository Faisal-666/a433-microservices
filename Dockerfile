FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN rm -rf node_modules && \
    npm cache clean --force && \
    npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD [ "npm", "run", "serve" ]