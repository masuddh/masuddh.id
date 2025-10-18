---
title: "AWS : Membuat VPC (Virtual Private Cloud) dengan Public Subnet dan Private Subnet"
date: 2021-02-24 15:43:00 +0700
categories: [Cloud]
tags: [aws]
---

Assalamu'alaikum semua, pada kesempatan kali ini kita akan belajar bagaimana membuat VPC (Virtual Private Cloud) di Amazon Web Services.

Amazon VPC adalah sebuah layanan AWS yang memungkinkan kita untuk mengatur jaringan dengan beberapa network dimana kita memiliki kontrol penuh terhadap pembuatan ip, subnet, security, internet gateway. Sehingga mudah di kelola dan aman dari ancaman luar.

Berikut topologi yang sudah saya buat. Cukup sederhana yah, jadi ada dua buah server, yang masing masing memiliki subnet berbeda yaitu public dan private. 

Oke daripada bingung langsung saja ke tutorialnya.

[![](/assets/img/posts/Untitled+Document+%25282%2529.png)](/assets/img/posts/Untitled+Document+%25282%2529.png)

  

  

  

  

  

  

  

  

**1\. Login ke AWS Management Console dan pilih menu VPC**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**2\. Masuk ke Your VPCs, kemudian Create**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

**3\. Berikan nama VPC bebas, dan isikan CIDR sesuai topologi di atas, kemudian Create**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**  
  
**

**4\. Membuat internet gateway, agar instances dapat terhubung ke internet**

**  
**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

**5\. Attach Internet Gateway ke VPC Kita**

**  
**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**  
**

**6\. Membuat Subnet public dan private**

**  
**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**  
  
7\. Membuat route table, secara default, akan ada 1 route table ketika kita membuat VPC, nah kita jadikan route table ini sebagai public route table.  **

**  
**

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**

**setelah itu masuk ke routes dan menambahkan akses internet ke public RT**

**  
**

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
  
**

**kemudian masukan source 0.0.0.0/0 sebagai default gateway internet yang sudah dibuat sebelumnya**

**  
**

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**

**  
**

**kemudian tambahkan subnet public ke pubic RT**

  

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
kemudian tinggal membuat private RT dan edit subnet ke private subnet**

**  
**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
**berhubung private subnet tidak dikasih askses internet, jadi tidak perlu mengatur routes nya.**

**  
**

**  
**

**8\. Kemudian kita edit security group. Sournya ubah ke My IP agar yang bisa akses hanya ip kita. jika ingin menambahkan akses ip lainya bisa add rule lagi.**

**  
**

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
9\. Edit inbound rule dari Network ACL menjadi ip kita**

**  
**

**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
10\. Kita sudah berhasil membuat VPC, selanjutnya adalah pengujian dengan membuat instances di EC2.**

**  
**

**[Untuk membuat EC2 bisa diklik ini](https://zimmernet.blogspot.com/2021/02/create-ec2-instances-with-our-vpc.html)**

  

**Maaf jika ada salah kata dalam menyampaikan penjelasan.**

**  
**

**Terima kasih :)**

**  
**

**

  

  
  
**

**  
**

**  
**