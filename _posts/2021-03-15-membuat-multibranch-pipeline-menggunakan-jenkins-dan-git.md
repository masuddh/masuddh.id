---
title: "Membuat Multibranch Pipeline Menggunakan Jenkins dan GIt"
date: 2021-03-15 14:05:00 +0700
categories: [DevOps]
tags: [cicd]
---

Assalamu'alaikum, pada jurnal kali ini saya akan mencoba membuat multibranch pipeline dengan Jenkins dan Git. Oke langsung saja..

> **Prerequisites:** Masuk ke Dashboard Jenkins terlebih dahulu. Untuk langkah installasinya bisa dilihat di [sini](https://zimmernet.blogspot.com/2021/03/installing-jenkins-on-aws-ec2-ubuntu.html).

## 1. Create a Job

Klik **Create a job**

[![](/assets/img/posts/image(58).png)](/assets/img/posts/)

## 2. Beri Nama Project

Disini saya memberi nama **my-pipeline** dan pilih **Multibranch Pipeline**

[![](/assets/img/posts/image(57).png)](/assets/img/posts/)

## 3. Branch Sources

Pilih yang **Git**

[![](/assets/img/posts/image(56).png)](/assets/img/posts/)

- Masukan URL repository kalian dari GitLab
- Membuat credentials

[![](/assets/img/posts/image(54).png)](/assets/img/posts/)

Disini saya menyiapkan 4 branch di project GitLab, yaitu ada **master, fitur-1, dev dan bug**:

[![](/assets/img/posts/image(51).png)](/assets/img/posts/)

## 4. Save Konfigurasi

Setelah itu klik **Save** pada konfigurasi Jenkins:

[![](/assets/img/posts/image(50).png)](/assets/img/posts/)

## 5. Lihat Hasil

Dan lihat hasil log nya, disitu sudah tertera **SUCCESS** dan terdapat 4 branch:

[![](/assets/img/posts/image(49).png)](/assets/img/posts/)

---

Mungkin itu saja dulu, nanti akan ada lanjutannya.

Sekian!