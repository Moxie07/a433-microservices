# Menarik image node:20.9.0-alpine sebagai base image.
FROM node:20.9.0-alpine as base
# Menetapkan working directory untuk container adalah /src.
WORKDIR /src
# Salin berkas package.json dan package-lock.json ke WORKDIR saat ini.
COPY package*.json ./
# Salin berkas .env ke WORKDIR saat ini.
COPY .env ./
# Salin berkas berekstensi js ke WORKDIR saat ini.
COPY *.js ./

# Menarik base image sebagai dasar dari production image.
FROM base as production
# Menyetel environment NODE_ENV menjadi production.
ENV NODE_ENV=production
# Menginstall dependencies yang diperlukan, melalui npm.
RUN npm install
# Setelah container berjalan, perintah berikut akan dieksekusi.
CMD [ "node", "index.js" ]

# Menarik base image sebagai dasar dari dev image.
FROM base as dev
# Install bash, dengan baypass cache, dari alpine package.
RUN apk add --no-cache bash
# Unduh berkas wait-for-it.sh.
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# Ubah akses agar bisa dieksekusi.
RUN chmod +x /bin/wait-for-it.sh

# Menyetel environment NODE_ENV menjadi development.
ENV NODE_ENV=development
# Menginstall dependencies yang diperlukan, melalui npm.
RUN npm install
# Setelah container berjalan, perintah berikut akan dieksekusi.
CMD [ "nodemon", "index.js" ]
