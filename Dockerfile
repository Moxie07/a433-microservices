# Mengunduh image node:14 yang akan dijadikan dasar dalam pembuatan image.
FROM node:14

# Membuat direktori baru bernama /app , dan pindah ke direktori tersebut, menjadikannya menjadi direktori kerja saat ini.
WORKDIR /app

# Menyalin semua ada dalam direktori kerja di mesin host, ke direktori kerja di container.
COPY . .

# Menentukan environment yang dibutuhkan, yakni production untuk NODE_ENV dan item-db untuk DB_HOST .
ENV NODE_ENV=production DB_HOST=item-db

# Menjalankan beberapa perintah yang diperlukan saat membuat image, yakni:
# npm install --production --unsafe-perm untuk menginstal dependensi yang dibutuhkan, dan
# npm run build untuk menjalankan skrip bernama build untuk membangun berdasarkan perintah skrip di dalamnya.
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 milik container.
EXPOSE 8080

# Menjalankan perintah npm start dari terminal CMD setelah container dijalankan.
CMD ["npm", "start"]
