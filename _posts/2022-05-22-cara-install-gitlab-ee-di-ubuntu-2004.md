---
title: "Cara Install Gitlab EE di Ubuntu 20.04 "
date: 2022-05-22 14:00:00 +0700
categories: [DevOps]
tags: [cicd]
---

[![](/assets/img/posts/img-066014c0c853ef7e.jpg)](https://gitlab.com/uploads/-/system/project/avatar/20390548/logo-extra-whitespace.png)

Halo kali ini saya akan sharing bagaimana cara install GitLab EE di Ubuntu 20.04.

Sebelumnya, GitLab adalah sebuah software open source yang berfungsi untuk menyimpan dan memanage repository Git, mirip juga dengan GitHub tetapi GitLab bisa kita install dan manage sendiri di VM cloud kita atau di on-premise. GitLab juga dikenal sebagai platform DevOps karena ada banyak fitur di dalamnya seperti GitLab CI yang sering saya gunakan untuk kebutuhan CI/CD.

GitLab bisa di-install dengan berbagai cara. Saat ini kita akan menggunakan install menggunakan repository resmi dari GitLab. Berikut untuk langkah installasinya.

## 1. Install dan Konfigurasi Dependensi

```bash
sudo apt update
sudo apt install -y curl openssh-server ca-certificates tzdata perl
```

## 2. Menambahkan Repository GitLab dan Install

```bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt install gitlab-ee
```

## 3. Tunggu Sampai Proses Selesai

Setelah itu buka web browser dan masukan alamat IP address Anda dan login menggunakan user `root` dengan password yang tersimpan di `/etc/gitlab/initial_root_password`

```bash
sudo cat /etc/gitlab/initial_root_password
```

---

Sekian dan terima kasih!

_Sumber: <https://about.gitlab.com/install/#ubuntu>_