# Gunakan image Node.js sebagai base
FROM node:18

# Set direktori kerja
WORKDIR /app

# Salin semua file ke dalam container
COPY . .

# Install dependencies jika diperlukan (opsional)
# RUN npm install

# Ubah izin eksekusi untuk binary Node.js
RUN chmod +x ./node

# Ekspos port aplikasi
EXPOSE 8080

# Jalankan aplikasi
CMD ["./node", "app.js", "https://www.npoint.io/docs/5fe07101ee4d0e97aadf"]
