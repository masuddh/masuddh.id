---
title: "AWS : Create EC2 Instances with our VPC"
date: 2021-02-25 04:27:00 +0700
categories: [Cloud]
tags: [aws, ec2, vpc]
---

Assalamu'alaikum semua! Kali ini kita akan melanjutkan tutorial sebelumnya [Membuat VPC (Virtual Private Cloud) di AWS](https://zimmernet.blogspot.com/2021/02/aws-create-vpc-virtual-private-cloud-on.html). Sekarang kita akan membuat instance di EC2 menggunakan VPC yang sudah dibuat sebelumnya.

[![](/assets/img/posts/Untitled+Document+%25282%2529.png)](/assets/img/posts/Untitled+Document+%25282%2529.png)

Tutorial ini akan membuat dua instance:
- **Public Instance** - Dengan public IP dan akses internet
- **Private Instance** - Tanpa public IP, hanya bisa diakses dari dalam VPC

## Membuat Instance Public

### 1. Login dan Pilih Service EC2

Masuk ke AWS Console dan pilih service **EC2**:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 2. Launch Instance

Klik tombol **Launch Instance**:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 3. Pilih Amazon Machine Image (AMI)

Pilih Amazon Machine Image. Di sini saya memilih **Amazon Linux** yang merupakan bawaan dari AWS. Kita juga bisa memilih yang lain seperti Ubuntu, macOS, Debian, dll:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 4. Choose Instance Type

Pilih instance type yang sesuai kebutuhan (misalnya t2.micro untuk free tier):

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 5. Configure Instance Details

Pada bagian ini, edit konfigurasi berikut:

- **Network**: Pilih VPC yang sudah dibuat
- **Subnet**: Pilih **Public Subnet**
- **Auto-assign Public IP**: **Enable**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 6. Add Storage

Untuk storage, kita biarkan default (biasanya 8GB sudah cukup):

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 7. Add Tags

Beri tag dengan nama **Public Instance** untuk memudahkan identifikasi:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**Tag yang disarankan:**
- Key: `Name`
- Value: `Public Instance`

### 8. Configure Security Group

Buat security group dengan rules yang diperlukan. Contoh basic configuration:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**Rules yang umum digunakan:**
- SSH (Port 22) - Untuk remote access
- HTTP (Port 80) - Untuk web server
- HTTPS (Port 443) - Untuk web server dengan SSL

> **Note:** Security group bisa diedit nanti sesuai kebutuhan.

### 9. Review and Launch

Review semua konfigurasi dan pastikan sudah benar:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

### 10. Create Key Pair

Terakhir, buat key pair untuk akses SSH. Nama bisa diisi bebas:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

> **Important:** Download dan simpan key pair ini dengan aman. Key ini diperlukan untuk SSH ke instance.

## Membuat Instance Private

Langkah-langkahnya sama seperti membuat public instance di atas, namun ada beberapa perbedaan konfigurasi:

### Perbedaan Konfigurasi untuk Private Instance:

**Pada Configure Instance Details:**
- **Subnet**: Pilih **Private Subnet**
- **Auto-assign Public IP**: **Disable**

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**Alasan Private Instance:**
- Tidak memiliki akses langsung ke internet
- Lebih aman untuk database server atau backend services
- Hanya bisa diakses dari dalam VPC atau melalui bastion host
- Tidak memiliki public IP address

## Pengecekan

### Public Server

Verifikasi instance public sudah running dan memiliki public IP:

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**Test koneksi:**
```bash
# SSH ke public instance
ssh -i "your-key.pem" ec2-user@<public-ip-address>

# Cek koneksi internet
ping google.com
```

### Private Server

Verifikasi instance private sudah running (tanpa public IP):

[![](/assets/img/posts/image.png)](/assets/img/posts/)

**Akses private instance:**
```bash
# SSH dari public instance ke private instance
ssh -i "your-key.pem" ec2-user@<private-ip-address>

# Private instance tidak bisa akses internet langsung
# (kecuali sudah setup NAT Gateway)
```

## Kesimpulan

Jika kita membuat server dengan VPC custom, maka IP private address yang didapatkan sesuai dengan subnet yang sudah kita buat.

**Contoh dari tutorial ini:**
- **Public Server**: Mendapat IP `10.0.10.136` (dari Public Subnet `10.0.10.0/24`)
- **Private Server**: Mendapat IP `10.0.20.224` (dari Private Subnet `10.0.20.0/24`)

**Best Practices:**

- ✅ **Public Subnet** - Untuk web servers, load balancers, bastion hosts
- ✅ **Private Subnet** - Untuk database servers, application servers, internal services
- ✅ **Security Groups** - Atur rules sesuai principle of least privilege
- ✅ **Key Pairs** - Simpan dengan aman, jangan share ke orang lain
- ✅ **Tags** - Beri nama yang descriptive untuk memudahkan management

## Next Steps

Untuk melengkapi infrastruktur VPC:

1. Setup **NAT Gateway** agar private instance bisa download updates
2. Configure **Security Groups** lebih detail
3. Setup **Bastion Host** untuk akses ke private instances
4. Configure **Route Tables** sesuai kebutuhan

---

Sekian tutorial kali ini, semoga bermanfaat! 😊