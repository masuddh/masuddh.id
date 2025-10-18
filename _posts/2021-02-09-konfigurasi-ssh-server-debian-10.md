---
title: "Konfigurasi SSH server Debian 10"
date: 2021-02-09 01:48:00 +0700
categories: [Linux]
tags: [linux]
---

Assalamu'alaikum, semangat pagi! Kali ini kita akan belajar bagaimana mengkonfigurasi SSH server di Debian 10. Simpelnya, SSH adalah suatu protokol yang memungkinkan user client dapat mengakses atau memodifikasi apa saja yang ada di dalam server. Oke langsung saja ke tutorialnya.

## 1. Install OpenSSH Server

```bash
apt -y install openssh-server
```

[![](/assets/img/posts/image.png)](/assets/img/posts/)

## 2. Cek IP Address

```bash
ip addr
```

[![](/assets/img/posts/image.png)](/assets/img/posts/)

## 3. Konfigurasi SSH Client di Windows 10

### Opsi 1: Menggunakan PuTTY

Download PuTTY di [sini](https://www.putty.org/)

- Masukan IP address server:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

- Pilih **Yes**:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

- Login menggunakan user biasa dan sudah bisa terhubung:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### Opsi 2: Menggunakan Windows PowerShell

```powershell
ssh user@ip-address
```

[![](/assets/img/posts/image.png)](/assets/img/posts/)

---

Selesai!

  

  

  

  

  

  

  

Nah, cukup mudah bukan? Sekian dan terima kasih..