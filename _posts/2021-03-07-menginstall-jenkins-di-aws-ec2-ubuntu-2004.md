---
title: "Menginstall Jenkins di AWS EC2 Ubuntu 20.04"
date: 2021-03-07 09:58:00 +0700
categories: [Cloud]
tags: [aws]
---

Assalamu'alaikum, pada kesempatan kali ini kita akan belajar tentang Jenkins.

Jenkins adalah sebuah tool CI/CD (Continuous Integration/Continuous Development), ini adalah tool otomatisasi yang membantu dalam build, test dan deploy aplikasi dengan mudah. Jenkins ditulis dengan Java dan dilengkapi ratusan plugin di dalamnya. Nah, kali ini kita akan mencoba menginstallnya di server AWS EC2 Ubuntu 20.04.

## Pre-requisites

- AWS account
- EC2 Instance Ubuntu 20.04 atau lebih

## Install Java

Jenkins membutuhkan Java agar dapat berjalan, maka dari itu kita harus menginstalnya terlebih dahulu.

Pertama, update system terlebih dahulu:

```bash
sudo apt update -y
```

Kemudian install Java. Untuk versinya bisa bebas karena tidak akan berpengaruh pada Jenkins nantinya:

```bash
sudo apt install openjdk-8-jdk
```

Melihat versi Java:

```bash
java -version
```

[![](/assets/img/posts/image(105).png)](/assets/img/posts/image(105).png)

## Download dan Install Jenkins

Pertama, kita tambahkan repository dari Jenkins. Bisa cek di sini: <https://www.jenkins.io/doc/book/installing/linux/#debianubuntu>

```bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

[![](/assets/img/posts/image(108).png)](/assets/img/posts/image(108).png)

Selanjutnya, tambahkan repository paket Debian ke sources.list server:

```bash
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

Kemudian update system:

```bash
sudo apt update
```

Setelah itu, install Jenkins:

```bash
sudo apt install jenkins
```

[![](/assets/img/posts/image(104).png)](/assets/img/posts/image(104).png)

## Menjalankan Jenkins

Jalankan dengan perintah:

```bash
sudo systemctl start jenkins
```

[![](/assets/img/posts/image(101).png)](/assets/img/posts/image(101).png)

Selanjutnya enable Jenkins:

```bash
sudo systemctl enable jenkins
```

[![](/assets/img/posts/image(100).png)](/assets/img/posts/image(100).png)

  

Kemudian cek statusnya

$ sudo systemctl status jenkins

[![](/assets/img/posts/image(102).png)](/assets/img/posts/image(102).png)

## Akses Jenkins 

Sebelumnya edit Security Group instance kita untuk membuka port 8080

  

1\. Masuk ke security group, kemudian tambahkan port 8080 di indbound rule

  

[![](/assets/img/posts/image(99).png)](/assets/img/posts/image(99).png)  
---  
  
  

[![](/assets/img/posts/image(98).png)](/assets/img/posts/image(98).png)

  
  
Kita dapat mengakses jenkins dengan web browser dengan memasukan alamat ip kita disertai port default jenkins yaitu 8080. > _ipaddress:8080_

 _  
_

[![](/assets/img/posts/Screenshot+from+2021-03-07+16-21-02.png)](/assets/img/posts/Screenshot+from+2021-03-07+16-21-02.png)

  

Kemudian untuk mengatahui**administrator password** bisa dengan perintah 

$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword

[![](/assets/img/posts/image(97).png)](/assets/img/posts/image(97).png)

  

selanjutnya install sugeggested plugin dan tunggu hingga selesai

  

[![](/assets/img/posts/Screenshot+from+2021-03-07+16-46-24.png)](/assets/img/posts/Screenshot+from+2021-03-07+16-46-24.png)

  

Kemudian buat user admin (opsional)

  

[![](/assets/img/posts/image(96).png)](/assets/img/posts/image(96).png)

  
Kita dapat melihat url untuk akses dan konfigurasi jenkins nya. Kemudian **save dan finish**


Dannn, yap sekarang kita sudah di tampilan dashboard dari Jenkins

  

[![](/assets/img/posts/Screenshot+from+2021-03-07+16-56-13.png)](/assets/img/posts/Screenshot+from+2021-03-07+16-56-13.png)

  

  

SEKIAN, SEMOGA BERMANFAAT :)