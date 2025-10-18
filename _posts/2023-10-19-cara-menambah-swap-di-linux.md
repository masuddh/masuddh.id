---
title: "Cara Menambah Swap di Linux"
date: 2023-10-19 10:05:00 +0700
categories: [Linux]
tags: [linux]
---

Swap digunakan untuk membantu pengelolaan RAM jika hampir penuh. Swap berasal dari penyimpanan internal kita. Barangkali ada yang mau nambah swap bisa ikuti langkah berikut, disini saya menggunakan os Ubuntu 22.04.

## Cek penggunaan memory saat ini

```bash
free -h
```

## Buat file Swap

Bisa menggunakan perintah `dd` atau `fallocate`. Disini saya bikin file swap dengan nama "swapfile" dan ukuran 2 GB:

```bash
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
```

Setelah dibuat, perlu diubah menjadi swap space dengan perintah `mkswap`:

```bash
sudo mkswap /swapfile
```

Setelah itu aktifkan swap file dengan perintah `swapon`:

```bash
sudo swapon /swapfile
```

Lanjut tambahkan ke `/etc/fstab` agar konfigurasi permanent:

[![](/assets/img/posts/img-c8081d9a91f63923.jpg)](/assets/img/posts/img-c8081d9a91f63923.jpg)

## (Opsional) Ubah Permission

Kemudian ubah permission agar hanya dapat diakses oleh root:

```bash
sudo chmod 600 /swapfile
```

## Verifikasi

Terakhir cek apakah sudah berhasil ditambahkan:

```bash
sudo swapon --show
```

[![](/assets/img/posts/img-f32556b958d816ba.jpg)](/assets/img/posts/img-f32556b958d816ba.jpg)

---

Oke sudah selesai, terima kasih!