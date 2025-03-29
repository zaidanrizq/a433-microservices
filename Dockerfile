# Menggunakan base image node dari Docker Hub dengan tag 14 (versi Node.js 14)
FROM node:14

# Membuat dan pindah working directory ke directory app
WORKDIR /app

# Mensalin seluruh file/folder yang ada lokasi lokal saat ini ke workind directory 
COPY . .

# Menjalankan aplikasi dalam production mode 
ENV NODE_ENV=production

# Menggunakan container bernama item-db sebagai database host
ENV DB_HOST=item-db


# Instalasi dependencies dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Membuka port 8080 pada container
EXPOSE 8080

# Menjalankan server
CMD ["npm","start"]
