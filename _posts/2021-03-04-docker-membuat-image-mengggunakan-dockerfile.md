---
title: "Docker : Membuat image mengggunakan Dockerfile "
date: 2021-03-04 16:56:00 +0700
categories: [DevOps]
tags: [docker]
---

Assalamu'alaikum, kali ini kita akan belajar bagaimana cara membuat image menggunakan Dockerfile.

Dockerfile sendiri adalah sebuah file teks yang di dalamnya berisi perintah untuk membangun sebuah image. Berikut langkah-langkahnya.

> **Prerequisites:** Pastikan OS atau VM sudah terinstall Docker.

## 1. Menyiapkan Aplikasi

Disini saya membuat aplikasi web sederhana dengan menggunakan Python. Untuk source codenya bisa diambil di [sini](https://github.com/zimmersrv/simple-webapp-python).

[![](/assets/img/posts/image(code).png)](/assets/img/posts/image(code).png)

## 2. Membuat Direktori Baru

```bash
mkdir web
cd web
```

## 3. Membuat Dockerfile

Berikut Dockerfile yang telah saya buat:

```dockerfile
FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python python3-pip
RUN pip3 install six
COPY main.py /app/main.py
CMD ["python3", "/app/main.py"]
```

**Penjelasan:**
- `FROM ubuntu:20.04` - Menggunakan OS Ubuntu 20.04
- `RUN apt-get update && apt-get upgrade` - Untuk mengupdate dan upgrade OS Ubuntu
- `RUN apt-get install -y python python3-pip` - Menginstall Python dan pip3
- `RUN pip3 install six` - Menginstall package six
- `COPY main.py /app/main.py` - Untuk menyalin file ke folder app/
- `CMD ["python3", "/app/main.py"]` - Perintah untuk menjalankan aplikasi

## 4. Build Image

Pastikan file app dan Dockerfile berada di satu folder yang sama.

Kemudian, build image dengan perintah:

```bash
docker build -t webapp .
```

[![](/assets/img/posts/image(124).png)](/assets/img/posts/image(124).png)

Parameter `-t` digunakan untuk memberi nama sebuah image.

Tunggu hingga proses selesai:

[![](/assets/img/posts/image(123).png)](/assets/img/posts/image(123).png)

Cek image yang telah dibuat:

```bash
docker images
```

[![](/assets/img/posts/image(122).png)](/assets/img/posts/image(122).png)

## 5. Menjalankan Image

Setelah berhasil membuat image, tinggal kita jalankan sebagai container:

```bash
docker run -p 8080:8080 webapp
```

[![](/assets/img/posts/image(121).png)](/assets/img/posts/image(121).png)

Parameter `-p 8080:8080` digunakan agar port 8080 bisa diakses dari luar.

## 6. Pengecekan

Untuk pengecekan bisa dibuka di web browser: `localhost:8080` atau `ip-address:8080`

[![](/assets/img/posts/image(128).png)](/assets/img/posts/image(128).png)

---

Sekian saja tutorial membuat image menggunakan Dockerfile, semoga bermanfaat!

Enjoyyy 🐳