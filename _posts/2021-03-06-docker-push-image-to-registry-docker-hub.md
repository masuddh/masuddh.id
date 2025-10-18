---
title: "Docker : Push Image To Registry (Docker Hub)"
date: 2021-03-06 04:43:00 +0700
categories: [DevOps]
tags: [docker]
---

Melanjutkan materi sebelumnya yaitu [Create image using Dockerfile](https://zimmernet.blogspot.com/2021/03/docker-create-image-using-dockerfile.html). Pada kesempatan kali ini, kita akan belajar bagaimana untuk upload image yang sudah kita buat ke Registry.

Registry adalah sebuah penyimpanan atau repository yang berfungsi untuk menyimpan image. Untuk sistem kerjanya mirip dengan sistem Git, dimana kita bisa pull (mengambil image orang lain atau sumber) dan bisa push (membuat image sendiri lalu upload). Disini saya akan menggunakan Docker Hub sebagai registry nya.

## 1. Membuat Akun Docker Hub

Buat akun Docker Hub [disini](https://hub.docker.com/).

[![](/assets/img/posts/Screenshot+from+2021-03-06+10-42-14.png)](/assets/img/posts/Screenshot+from+2021-03-06+10-42-14.png)

## 2. Login di Terminal

Login menggunakan akun yang sudah dibuat di terminal:

```bash
docker login
```

[![](/assets/img/posts/image(120).png)](/assets/img/posts/image(120).png)

## 3. Melihat Image yang Akan Diupload

```bash
docker images
```

[![](/assets/img/posts/image(119).png)](/assets/img/posts/image(119).png)

## 4. Buat Repository di Docker Hub

Pertama, klik **Create Repository** di dashboard, kemudian isikan nama dan deskripsi (opsional).

[![](/assets/img/posts/image(117).png)](/assets/img/posts/image(117).png)

Kemudian **Create**, ini adalah tampilan repository nya:

[![](/assets/img/posts/Screenshot+from+2021-03-06+11-21-37.png)](/assets/img/posts/Screenshot+from+2021-03-06+11-21-37.png)

## 5. Push Image ke Docker Hub

Pertama, lihat image yang ada:

```bash
docker images
```

[![](/assets/img/posts/image(119).png)](/assets/img/posts/image(119).png)

Berhubung image `zimmersrv/webapp` belum ada, maka kita tambahkan dulu dengan perintah tag:

```bash
docker tag webapp zimmersrv/webapp
```

[![](/assets/img/posts/image(116).png)](/assets/img/posts/image(116).png)

Cek image nya:

```bash
docker images
```

[![](/assets/img/posts/image(114).png)](/assets/img/posts/image(114).png)

Nah, berhubung sudah ada, selanjutnya tinggal push:

```bash
docker push zimmersrv/webapp
```

[![](/assets/img/posts/image(115).png)](/assets/img/posts/(115).png)

## 6. Pengecekan

Setelah berhasil di-push, maka tinggal cek di Docker Hub:

[![](/assets/img/posts/image(113).png)](/assets/img/posts/image(113).png)

Setelah muncul image di Docker Hub, maka kita telah berhasil untuk mem-push image ke Docker Hub.

---

Sekian, semoga bermanfaat! 🐳