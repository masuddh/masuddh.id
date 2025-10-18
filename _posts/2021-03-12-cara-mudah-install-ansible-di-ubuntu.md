---
title: "Cara Mudah Install Ansible di Ubuntu"
date: 2021-03-12 15:17:00 +0700
categories: [Linux]
tags: [linux]
---

Kali ini saya akan mencoba install Ansible di Ubuntu 20.04. Untuk menginstallnya kita perlu mengkonfigurasi PPA di server kita. Ikuti perintah dibawah ini.

## Langkah Install

Update sistem:

```bash
sudo apt-get update
```

Install dependencies:

```bash
sudo apt-get install software-properties-common
```

Tambahkan PPA Ansible:

```bash
sudo apt-add-repository ppa:ansible/ansible
```

Update repository:

```bash
sudo apt-get update
```

Install Ansible:

```bash
sudo apt-get install ansible
```

## Verifikasi

Untuk memeriksa apakah Ansible sudah terinstall dengan baik:

```bash
ansible --version
```

[![](/assets/img/posts/image(70).png)](/assets/img/posts/)

---

Sekian!