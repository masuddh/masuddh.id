---
title: "Menjalankan Jenkins dengan Docker Container"
date: 2021-03-08 08:42:00 +0700
categories: [DevOps]
tags: [docker, jenkins]
---

Assalamu'alaikum! Kali ini kita akan mencoba menjalankan Jenkins di Docker Container. Sebelumnya saya sudah pernah mencoba menginstallnya secara manual di virtual machine. Bisa klik di [sini.](https://zimmernet.blogspot.com/2021/03/installing-jenkins-on-aws-ec2-ubuntu.html)

Menjalankan Jenkins di Docker memiliki beberapa keuntungan seperti mudah di-setup, portable, dan isolasi environment yang baik.

## Prerequisites

- Docker sudah terinstall di sistem
- Port 8080 dan 50000 tersedia

## 1. Cari Jenkins Image di Docker Hub

Pertama, kunjungi website Docker Hub untuk melihat image Jenkins: [Docker Hub - Jenkins](https://hub.docker.com/search?q=jenkins&type=image)

[![](/assets/img/posts/image(94).png)](/assets/img/posts/image(94).png)

Kita akan menggunakan image official `jenkins/jenkins:lts` (Long Term Support).

## 2. Jalankan Jenkins Container

Masukan perintah berikut untuk menjalankan Jenkins:

```bash
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

[![](/assets/img/posts/image(92).png)](/assets/img/posts/image(92).png)

**Penjelasan parameter:**

- `-p 8080:8080` - Expose port 8080 untuk web UI Jenkins (default port)
- `-p 50000:50000` - Expose port 50000 untuk master/slave communication
- `-d` - Run in detached mode (container berjalan di background)
- `-v jenkins_home:/var/jenkins_home` - Volume untuk persist data Jenkins

Kemudian cek container yang sedang berjalan:

```bash
docker ps
```

[![](/assets/img/posts/image(91).png)](/assets/img/posts/image(91).png)

## 3. Setup Jenkins

Akses Jenkins di web browser dengan memasukkan `http://localhost:8080` atau `http://ipaddress:8080`:

[![](/assets/img/posts/Screenshot+from+2021-03-08+15-29-38.png)](/assets/img/posts/Screenshot+from+2021-03-08+15-29-38.png)

### Dapatkan Initial Admin Password

Untuk mengetahui password awal Jenkins, gunakan perintah:

```bash
docker exec <container_id> cat /var/jenkins_home/secrets/initialAdminPassword
```

[![](/assets/img/posts/image(89).png)](/assets/img/posts/image(89).png)

Copy password tersebut dan paste di halaman unlock Jenkins.

### Install Plugins

Selanjutnya pilih **Install suggested plugins** dan tunggu hingga selesai:

[![](/assets/img/posts/Screenshot+from+2021-03-08+15-36-09.png)](/assets/img/posts/Screenshot+from+2021-03-08+15-36-09.png)

### Create Admin User

Kemudian buat user dan password untuk admin Jenkins.

### Dashboard Jenkins

Dan inilah tampilan dashboard Jenkins setelah setup selesai:

[![](/assets/img/posts/Screenshot+from+2021-03-08+15-38-32.png)](/assets/img/posts/Screenshot+from+2021-03-08+15-38-32.png)

## Tips Tambahan

**Melihat logs container:**
```bash
docker logs <container_id>
```

**Stop container:**
```bash
docker stop <container_id>
```

**Start container yang sudah ada:**
```bash
docker start <container_id>
```

**Hapus container:**
```bash
docker rm <container_id>
```

## Kesimpulan

Menjalankan Jenkins di Docker Container memberikan beberapa keuntungan:

- ✅ **Setup cepat** - Tidak perlu install manual dependencies
- ✅ **Portable** - Bisa dipindah ke server lain dengan mudah
- ✅ **Isolasi** - Tidak mengotori sistem host
- ✅ **Mudah di-update** - Tinggal pull image terbaru
- ✅ **Data persisten** - Dengan Docker volume, data tidak hilang

---

Sekian dan terima kasih! 😊