---
title: "Konfigurasi Router Gateway Mikrotik menggunakan Virtualbox"
date: 2021-02-14 14:10:00 +0700
categories: [Networking]
tags: [networking]
---

Pada kesempatan kali ini kita akan mengkonfigurasi mikrotik sebagai Router Gateway. Jadi tujuan dari konfigurasi ini adalah agar router mikrotik bisa mengakses internet dan meneruskan internet kepada client. Oke langsung saja ke tutorialnya.

  

Topologi 

  

[![](/assets/img/posts/image.png)](/assets/img/posts/)

ether1 = 192.168.10.2 /28

ether2 = 192.168.20.1 /24

  

Bahan yang dibutuhkan :

1.    -  Virtualbox

2.     - Iso Mikrotik

3.      - Iso client : win7 lite

4.      - Koneksi internet

  

**STEP 1 : INSTALLASI**

-        Pastikan sudah di install semua point yang ada di atas.****

-        Atur settingan networknya sebagai berikut :****

**Mikrotik**

-        **Adapter 1 = NAT**

-        **Adapter 2 = Internal Network**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**Client : Win 7 lite**

**Adapter 1 = Internal Network**

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
  
**

**STEP 2 : MEMBERI IP ADDRESS MIKROTIK**

-        Start Mikrotik pada virtualbox, login menggunakan username :**admin** password :**kosongkan**

-        Masukan ip address sesuai topologi di atas.

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

**STEP 3 : AKSES MIKROTIK DENGAN WIN 7 MENGGUNAKAN WINBOX**

-        - Pastikan sudah download winbox pada client****

-        - Kemudian konek dengan mac address****

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

**STEP 4 : KONFIGURASI ROUTER GATEWAY**

-        - Request ip dhcp client untuk ether1 (Internet), agar mikrotik mendapat akses internet****

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  

-         - Tambahkan ip address untuk ether2 . (192.168.20.1/24)

**IP    IP > Addresses >  \+ > isi ip > ether2**

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
**

-       -   Membuat dhcp server untuk ether2

**Ip > DHCP Server > DHCP Setup > ether2 > next sampai selesai **

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
**

-         - Cek ip address client menggunakan **cmd > ketikan “ipconfig"**

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
  
**

** **

**  - ** Konfigurasi DNS

**  Ip > DNS > isikan servers 8.8.8.8 dan 8.8.4.4 (DNS google) > ceklist “Allow Remote Request”**

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
  
**

****

-       -  Konfigurasi Firewall NAT, bertujuan agar client dapat mengakses internet****

**Ip   Ip > Firewall > NAT > \+ > Out interface (ether1) > Action (masquerade)**

****

****[![](/assets/img/posts/image.png)](/assets/img/posts/)

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
  
  
**

\- Default routing untuk internet mengrah ke ether1 atau sebagai ISP

[![](/assets/img/posts/image.png)](/assets/img/posts/)

  
  

-        - Cek akses internet mikrotik

**New terminal**

****

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
**

-         - Cek akses internet pada client 

**Ping 8.8.8.8**

** **

**[![](/assets/img/posts/image.png)](/assets/img/posts/)**

**  
**

**STEP 5 : FINISH**

-        Setelah mengikuti langkah-langkah di atas, berarti sudah bisa membuat Mikrotik sebagai router gateway internet****

** **

**Sekian dan terima kasih  **