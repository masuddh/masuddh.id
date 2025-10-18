---
title: "Schedule your VM on GCP"
date: 2022-08-30 14:59:00 +0700
categories: [Cloud]
tags: [gcp]
---

Mengatur jadwal pada instance/virtual machine di GCP adalah hal yang berguna untuk menghemat biaya server, terutama untuk environment development. Dengan fitur scheduling ini, VM bisa otomatis start dan stop sesuai jadwal yang kita tentukan. Berikut adalah langkah-langkahnya.

## 1. Buat Instance Schedule

Masuk ke menu **Compute Engine**, kemudian pilih **Instance schedules**:

[![](/assets/img/posts/img-9ea5aed7389577de.jpg)](/assets/img/posts/img-9ea5aed7389577de.jpg)

## 2. Create a New Schedule

Klik **Create a new schedule** dan atur sesuai kebutuhan. Di sini saya atur sesuai jam kerja (08:00 - 17:00, Senin - Jumat):

[![](/assets/img/posts/img-ceeea72b6f75d06d.jpg)](/assets/img/posts/img-ceeea72b6f75d06d.jpg)

**Pengaturan schedule:**
- **Start time**: Jam berapa VM akan dinyalakan otomatis
- **Stop time**: Jam berapa VM akan dimatikan otomatis  
- **Time zone**: Sesuaikan dengan zona waktu Anda
- **Frequency**: Pilih hari-hari mana saja schedule aktif

## 3. Tambahkan VM ke Schedule

Kemudian tinggal tambahkan VM yang mau di-schedule:

[![](/assets/img/posts/img-faaba0920bc03a84.jpg)](/assets/img/posts/img-faaba0920bc03a84.jpg)

## 4. Fix Permission Error

Biasanya di step ini akan dapat error permission. Untuk mengatasi itu kita perlu tambahkan custom role.

Masuk ke menu **IAM** dan centang **Include Google-provided role grants**:

[![](/assets/img/posts/img-3f85aea6b940c602.jpg)](/assets/img/posts/img-3f85aea6b940c602.jpg)

Cari **Compute Engine Service Agent** dan tambahkan role **Compute Instance Admin (v1)**:

[![](/assets/img/posts/img-f22c091a85a126d9.jpg)](/assets/img/posts/img-f22c091a85a126d9.jpg)

[![](/assets/img/posts/img-50d97bf0ad459ec1.jpg)](/assets/img/posts/img-50d97bf0ad459ec1.jpg)

## 5. Add Instances

Setelah itu kita bisa add instances dengan mudah tanpa error permission.

## Kesimpulan

Dengan menggunakan Instance Schedule di GCP, kita bisa:

- ✅ **Menghemat biaya** - VM hanya running saat dibutuhkan
- ✅ **Otomatis** - Tidak perlu manual start/stop setiap hari
- ✅ **Fleksibel** - Bisa atur jadwal berbeda untuk VM berbeda
- ✅ **Cocok untuk development** - Environment dev tidak perlu running 24/7

---

Sekian, terima kasih sudah mampir! 😊