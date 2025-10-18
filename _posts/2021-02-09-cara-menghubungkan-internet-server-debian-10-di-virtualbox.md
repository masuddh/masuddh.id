---
title: "Cara menghubungkan internet server Debian 10 di VirtualBox"
date: 2021-02-09 01:29:00 +0700
categories: [Linux]
tags: [linux]
---

Assalamu'alaikum, kali ini kita akan menghubungkan internet Debian 10 di virtualbox.

  

1\. Ubah setingan network menjadi **bridge mode**

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
  
**

2\. Konfigurasi ip address menjadi seperti ini || "nano /etc/network/interfaces"  

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
  

3\. Restart network || "systemctl restart networking"

4\. Cek ip address

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
  

5\. Tes koneksi dengan cara ping ke google

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
  

  

**  
  
**

****

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
  
**

**  
  
**

**  
**

**  
**

**  
**

**  
**

**  
**

**  
**

**  
**

**  
**

**  
**

Dengan begitu sever debian 10 sudah bisa konek dengan internet. Sekian dan terima kasih..