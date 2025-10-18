---
title: "Cara Mirroring Repository di Gitlab"
date: 2022-05-22 14:58:00 +0700
categories: [DevOps]
tags: [cicd]
---

Mirroring adalah salah satu metode untuk melakukan backup repository kita ke penyedia Git lainnya atau juga dari on-premise ke cloud. Kali ini kita akan mirroring dari GitLab ke GitLab.

Ada beberapa opsi untuk melakukan mirroring, yaitu dengan password dan SSH. Kita akan menggunakan SSH saja.

## 1. Buat Repository Sumber

Buat repository baru atau bisa menggunakan repository existing.

[![](/assets/img/posts/img-198e34c014ff3566.jpg)](/assets/img/posts/img-198e34c014ff3566.jpg)

## 2. Tambahkan File

[![](/assets/img/posts/img-ec5405990d697ed3.jpg)](/assets/img/posts/img-ec5405990d697ed3.jpg)

## 3. Buat Repository Tujuan

Buat repo baru yang akan menjadi tempat mirroring:

[![](/assets/img/posts/img-9a17f71e5b74e73b.jpg)](/assets/img/posts/img-9a17f71e5b74e73b.jpg)

## 4. Setup Mirroring

Kemudian masuk ke repository yang akan di-mirror: **Settings → Repository → Mirroring repositories**

[![](/assets/img/posts/img-3bdc1f90923b78ed.jpg)](/assets/img/posts/img-3bdc1f90923b78ed.jpg)

- Masukan URL SSH dari repository baru dengan catatan:
  - Tambahkan `ssh://` di depan
  - Ganti tanda `:` dengan `/`
- Pilih yang **Detect host keys**
- Klik **Mirror Repository**

## 5. Copy SSH Key

Setelah itu copy SSH key:

[![](/assets/img/posts/img-ac7b9335b52be5ae.jpg)](/assets/img/posts/img-ac7b9335b52be5ae.jpg)

## 6. Tambahkan SSH Key

Masuk ke repository baru dan masukan SSH key yang baru di-copy tadi: **User Settings → SSH Keys**

[![](/assets/img/posts/img-7c0f4592e6f0373f.jpg)](/assets/img/posts/img-7c0f4592e6f0373f.jpg)

## 7. Update Mirror

Kemudian update dan tunggu hingga sukses:

[![](/assets/img/posts/img-6e6706666c62d602.jpg)](/assets/img/posts/img-6e6706666c62d602.jpg)

## 8. Verifikasi

Maka repository yang baru akan otomatis sinkron dengan repository lama:

[![](/assets/img/posts/img-ce945d3c43522021.jpg)](/assets/img/posts/img-ce945d3c43522021.jpg)

---

Demikian cara mirroring repository di GitLab. Sekian dan terima kasih!