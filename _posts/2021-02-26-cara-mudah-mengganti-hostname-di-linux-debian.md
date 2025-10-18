---
title: "Cara Mudah Mengganti Hostname di Linux Debian"
date: 2021-02-26 15:04:00 +0700
categories: [Linux]
tags: [linux]
---

Assalamu'alaikum, untuk mengganti hostname di Linux Debian cukup mudah, seperti di bawah ini.

## 1. Edit File /etc/hostname

Kemudian hapus yang lama dan ganti yang baru:

```bash
nano /etc/hostname
```

[![](/assets/img/posts/image(host1).png)](/assets/img/posts/image(host1).png)

## 2. Edit File /etc/hosts

```bash
nano /etc/hosts
```

[![](/assets/img/posts/image(host2).png)](/assets/img/posts/image(host2).png)

## 3. Reboot System

```bash
reboot
```

## Hasil

**Sebelum:**

[![](/assets/img/posts/image(host3).png)](/assets/img/posts/image(host3).png)

**Sesudah:**

[![](/assets/img/posts/image(host4).png)](/assets/img/posts/image(host4))

---

Terima kasih!