---
title: "Cara mudah Menginstall Docker Menggunakan Docker Script"
date: 2021-03-01 02:04:00 +0700
categories: [DevOps]
tags: [docker]
---

Assalamu'alaikum, kali ini kita akan memulai belajar Docker. Pertama-tama kita akan belajar bagaimana menginstallnya di server. Sebenarnya ada banyak cara dalam menginstall Docker. Untungnya dari Docker sendiri sudah menyiapkan script untuk menginstallnya di server kita dengan lebih mudah. Kali ini saya akan mencoba menginstall di Ubuntu 20.04 LTS.

## Langkah Install

1. Download script installer dari Docker:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```

2. Jalankan script installer:

```bash
sudo sh get-docker.sh
```

Dan tunggu proses installasinya hingga selesai. Cukup mudah bukan?