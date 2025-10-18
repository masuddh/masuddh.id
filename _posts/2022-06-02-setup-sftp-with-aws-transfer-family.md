---
title: "Setup SFTP with AWS Transfer Family"
date: 2022-06-02 08:00:00 +0700
categories: [Cloud]
tags: [aws]
---

SFTP atau Secure File Transfer Protocol adalah protokol yang berfungsi untuk kebutuhan transfer data _(upload/download)_. Pada koneksi antar client dan server, SFTP menggunakan SSH (Secure Shell Protocol) yang menjadikan proses transfer menjadi lebih aman. Kali ini kita akan menggunakan layanan dari AWS yang bernama AWS Transfer Family.

AWS Transfer Family adalah sebuah layanan untuk kebutuhan transfer seperti FTP, SFTP, FTPS. Service ini sudah bisa dibilang serverless, karena server yang bekerja sudah fully managed oleh AWS. Jadi kita tidak perlu memikirkan resource servernya.

Kita juga bisa custom domain untuk endpoint dari SFTP server kita. Untuk penyimpanannya nanti akan dikirimkan ke Amazon S3 seperti diagram di bawah ini.

[![](/assets/img/posts/Untitled%20Diagram.drawio.png)](/assets/img/posts/Untitled%20Diagram.drawio.png)

Oke langsung saja ke tutorialnya.

## 1. Buat Bucket S3

Pertama kita akan membuat bucket S3 terlebih dahulu sebagai media penyimpanannya.

Masuk ke menu **S3 → Bucket → Create bucket**

- Nama bucket diisi bebas
- Region juga bebas

[![](/assets/img/posts/1.1.png)](/assets/img/posts/1.1.png)

## 2. Setup IAM Role untuk User SFTP

Masuk ke menu **IAM → Roles → Create role** kemudian next:

[![](/assets/img/posts/2.png)](/assets/img/posts/2.png)

Add permission ke **AmazonS3FullAccess**:

[![](/assets/img/posts/3.png)](/assets/img/posts/3.png)

Selanjutnya beri nama dan create role:

[![](/assets/img/posts/4.png)](/assets/img/posts/4.png)

Untuk membatasi user, bisa edit file JSON pada role yang sudah dibuat:

[![](/assets/img/posts/5.png)](/assets/img/posts/5.png)

Edit jadi seperti ini:

[![](/assets/img/posts/6.png)](/assets/img/posts/6.png)

## 3. Membuat SFTP Server

Masuk ke menu **AWS Transfer Family**, kemudian **Create server**:

[![](/assets/img/posts/7.png)](/assets/img/posts/7.png)

Pilih yang **SFTP**:

[![](/assets/img/posts/8.png)](/assets/img/posts/8.png)

Kemudian pilih **Service managed**:

[![](/assets/img/posts/9.png)](/assets/img/posts/9.png)

Untuk endpoint nya kita biarkan default saja:

[![](/assets/img/posts/10.png)](/assets/img/posts/10.png)

Selanjutnya pilih **Amazon S3**:

[![](/assets/img/posts/11.png)](/assets/img/posts/11.png)

Langkah selanjutnya biarkan default saja dan klik **Create Server**:

[![](/assets/img/posts/12.png)](/assets/img/posts/12.png)

Tunggu sampai statusnya **Online**:

[![](/assets/img/posts/13.png)](/assets/img/posts/13.png)

Kemudian tambahkan user: **Users → Add users**

[![](/assets/img/posts/14.png)](/assets/img/posts/14.png)

Kita perlu menambahkan SSH key. Jika belum ada bisa mengikuti perintah dibawah ini:

[![](/assets/img/posts/18.png)](/assets/img/posts/18.png)

```bash
# Generate SSH key
ssh-keygen -t rsa -b 4096 -f sftp-key

# Lihat public key
cat sftp-key.pub
```

Kemudian copy dan paste key publiknya (saya sarankan untuk menjadikannya satu baris pada text editor):

[![](/assets/img/posts/17.png)](/assets/img/posts/17.png)

## 4. Cara Akses SFTP

### Menggunakan Terminal Linux

```bash
sftp -i sftp-key username@server-id.server.transfer.region.amazonaws.com
```

[![](/assets/img/posts/20.png)](/assets/img/posts/20.png)

### Menggunakan FileZilla

**Opsional:** Convert file SSH private key menjadi file PPK menggunakan PuTTY Generator:

[![](/assets/img/posts/19.png)](/assets/img/posts/19.png)

Kemudian masuk ke FileZilla dan masuk ke **File → Site Manager**:

[![](/assets/img/posts/21.png)](/assets/img/posts/21.png)

**Konfigurasi FileZilla:**
- Protocol: **SFTP - SSH File Transfer Protocol**
- Host: **server-id.server.transfer.region.amazonaws.com**
- Logon Type: **Key file**
- User: **username yang sudah dibuat**
- Key file: **Browse ke private key file (.pem atau .ppk)**

Setelah itu kita sudah bisa konek dan transfer file ke S3:

[![](/assets/img/posts/22.png)](/assets/img/posts/22.png)

## Kesimpulan

Kita sudah bisa membuat server SFTP sendiri dan transfer ke S3 menggunakan AWS Transfer Family. Keuntungan menggunakan service ini:

- ✅ Fully managed - tidak perlu maintain server
- ✅ Scalable - auto scale sesuai kebutuhan
- ✅ Secure - menggunakan SSH protocol
- ✅ Terintegrasi dengan S3 - data langsung masuk ke bucket
- ✅ Custom domain - bisa menggunakan domain sendiri

---

Sekian dan terima kasih!