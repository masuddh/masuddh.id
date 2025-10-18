---
title: 'Cara Memperbaiki Error "403 No valid crumb was included in the request" pada Jenkins'
date: 2023-11-14 12:44:00 +0700
categories: [DevOps]
tags: [cicd]
---

Biasanya error ini terjadi ketika kita setup Jenkins menggunakan reverse proxy. Pada kasus ini saya menggunakan Nginx untuk reverse proxy nya.

Error ini disebabkan karena secara default Jenkins memiliki fitur perlindungan CSRF atau Cross-Site Request Forgery. Jadi kalo konfigurasi proxy kita ga proper bisa saja kena error ini.

## Cara Mengatasinya

Masuk ke **Manage Jenkins → Security → CSRF Protection**

Kemudian ceklist pada **Enable proxy compatibility**

[![](/assets/img/posts/img-84283f245dc85551.jpg)](/assets/img/posts/img-84283f245dc85551.jpg)

---

Sudah, itu aja! Sekian 😊

