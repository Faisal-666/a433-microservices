# Image nodejs 14.21 dengan berbasis alpine agar lebih ringan
FROM node:14.21-alpine

# Work Directory
WORKDIR /app

# Menambahkan bash ke dalam image dnegan apk (paket manager untuk alpine)
RUN apk add --no-cache bash

# Download skrip ke dir /bin dan mengubah permission agar executeable
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /bin/wait-for-it.sh

# Menyalin file package.json & package-lock.json ke work directory
COPY package*.json ./

# Install dependensi
RUN npm install

# Copy semua ke dalam work dir
COPY . .

# Mengekpos port 3000
EXPOSE 3000

# Menjalankan skrip wait-for-it.sh, untuk memastikan service rabbitmq:service:5672 telah siap
# Jika service siap maka node index.js akan dijalankan
CMD ["/bin/wait-for-it.sh", "rabbitmq-service:5672", "--", "node","index.js"]
