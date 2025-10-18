---
title: "Cara Install dan Konfigurasi Apache Web Server di Ubuntu 20.10"
date: 2021-02-22 03:28:00 +0700
categories: [Linux]
tags: [linux]
---

Assalamu'alaikum semua, kali ini kita akan mencoba membuat web server menggunakan Apache. Server ini merupakan server yang sangat populer di dunia. Terdapat fitur-fitur yang membuat web Anda menjadi lebih powerful dan stabil. Oke langsung saja ke tutorialnya..

> **Prerequisites:** Pastikan Anda login sebagai user non-root dengan hak akses sudo.

## 1. Install Apache Web Server

Apache web server sudah tersedia langsung pada repository Ubuntu, jadi untuk menginstallnya cukup mudah. Tinggal update dan install saja:

```bash
sudo apt update
sudo apt install apache2
```    

## 2. Pengaturan Firewall

Sebelum masuk ke konfigurasi, kita perlu mengatur firewall agar UFW (Uncomplicated Firewall) dapat mengenali pengaturan yang dapat digunakan untuk enable dan disable akses ke Apache.

```bash
sudo ufw app list
```

Maka outputnya akan menampilkan daftar profile seperti ini:

```
Available applications:
  Apache
  Apache Full
  Apache Secure
```

**Penjelasan mengenai profile yang ada di Apache:**

1. **Apache** - Profil ini hanya akan membuka port 80 dan merupakan default serta tidak ter-enkripsi
2. **Apache Full** - Profil ini akan membuka port 80 dan port 443 (TLS/SSL) yang terenkripsi
3. **Apache Secure** - Nah yang satu ini adalah profile yang sangat direkomendasikan karena hanya membuka port 443 yang artinya sangat aman dan dapat meningkatkan SEO (Search Engine Optimization)

Kemudian masukan perintah:

```bash
sudo ufw allow 'Apache'
```

Output:

```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
Apache                     ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
Apache (v6)                ALLOW       Anywhere (v6)
```

## 3. Periksa Status Apache

Periksa apakah Apache sudah berjalan atau belum:

```bash
sudo systemctl status apache2
```

Output:

```
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled)
     Active: active (running) since Fri 2021-02-19 02:36:56 UTC; 1h 0min ago
       Docs: https://httpd.apache.org/docs/2.4/
   Main PID: 4465 (apache2)
      Tasks: 55 (limit: 1064)
     Memory: 5.3M
```

Kita bisa mengaksesnya atau melihat web page default dari Apache dengan web browser dengan cara memasukan alamat **IP server / localhost**. Maka akan tampak seperti ini:

[![](/assets/img/posts/apache2.jpg)](/assets/img/posts/apache2.jpg)

## 4. Menyiapkan Virtual Hosts

Virtual host digunakan untuk menghosting lebih dari satu domain dari satu server. Misal kita memiliki beberapa domain untuk dijalankan di satu server, dan konfigurasinya disimpan di dalam direktori default yaitu `/var/www/html`, maka ini bisa berjalan dengan baik. Maka dari itu perlu untuk membuat virtual host. Disini saya akan mencontohkan membuat domain dengan nama **zimmer.com**

### Membuat Direktori

```bash
sudo mkdir -p /var/www/zimmer.com/html
```

### Menetapkan Kepemilikan Direktori

```bash
sudo chown -R $USER:$USER /var/www/zimmer.com/html
```

### Mengubah Izin Hak Akses

```bash
sudo chmod -R 755 /var/www/zimmer.com
```

### Membuat Halaman Website

Selanjutnya membuat halaman website sederhana:

```bash
nano /var/www/zimmer.com/html/index.html
```

Isi dengan:

```html
<html>
    <head>
        <title>Welcome to Zimmernet</title>
    </head>
    <body>
        <h1>Success! The Zimmernet virtual host is working!</h1>
    </body>
</html>
```

Simpan dan exit.

### Konfigurasi Virtual Host

Kemudian buat file konfigurasi:

```bash
sudo nano /etc/apache2/sites-available/zimmer.com.conf
```

Isikan seperti ini:

```apache
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName zimmer.com
    ServerAlias www.zimmer.com
    DocumentRoot /var/www/zimmer.com/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

### Aktifkan Virtual Host

Aktifkan konfigurasi virtual host menggunakan a2ensite:

```bash
sudo a2ensite zimmer.com.conf
```

Dan matikan konfigurasi default:

```bash
sudo a2dissite 000-default.conf
```

### Test Konfigurasi

Selanjutnya uji kesalahan dengan cara:

```bash
sudo apache2ctl configtest
```

Output:

```
Syntax OK
```

### Restart Apache

Dan yang terakhir adalah restart Apache:

```bash
sudo systemctl restart apache2
```

## 5. Verifikasi

Kemudian buka web browser kalian dan masukan IP address local atau IP virtual machine, maka akan tampil seperti berikut:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

Setelah berhasil, selamat! 🎉

---

Sekian dan terima kasih!