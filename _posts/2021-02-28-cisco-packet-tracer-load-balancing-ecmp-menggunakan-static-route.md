---
title: "Cisco Packet Tracer : Load Balancing ECMP Menggunakan Static Route"
date: 2021-02-28 08:08:00 +0700
categories: [Networking]
tags: [networking, cisco]
---

Assalamu'alaikum semua! Pada kesempatan kali ini kita akan belajar bagaimana load balancing ECMP (Equal Cost Multi Path) pada Cisco Packet Tracer.

## Apa itu ECMP?

Menurut Wikipedia, ECMP adalah salah satu teknik routing dimana penerusan paket ke satu tujuan dapat terjadi melalui beberapa jalur yang terbaik. Jadi jika salah satu jalur mengalami kerusakan atau gangguan, maka router akan secara otomatis menggunakan jalur yang terbaik. Kali ini kita akan menggunakan static routing dalam load balancing.

## Topologi Jaringan

[![](/assets/img/posts/image(ecmp1).png)](/assets/img/posts/image(ecmp1).png)

Topologi ini menggunakan 5 router yang saling terhubung dengan multiple path untuk mencapai redundancy dan load balancing.

## Tabel IP Address

[![](/assets/img/posts/image(ecmp2).png)](/assets/img/posts/image(ecmp2).png)

[![](/assets/img/posts/image(ecmp3).png)](/assets/img/posts/image(ecmp3).png)

## Langkah 1: Konfigurasi IP Address Semua Perangkat

### Server

Klik **Desktop → IP Configuration**:

[![](/assets/img/posts/image(ecmp4).png)](/assets/img/posts/image(ecmp4).png)

### PC 1

[![](/assets/img/posts/image(ecmp5).png)](/assets/img/posts/image(ecmp5).png)

### PC 2

[![](/assets/img/posts/image(ecmp6).png)](/assets/img/posts/image(ecmp6).png)

### Router R1

[![](/assets/img/posts/image(ecmp7).png)](/assets/img/posts/image(ecmp7).png)

### Router R2

[![](/assets/img/posts/image(ecmp8).png)](/assets/img/posts/image(ecmp8).png)

### Router R3

[![](/assets/img/posts/image(ecmp9).png)](/assets/img/posts/image(ecmp9).png)

### Router R4

[![](/assets/img/posts/image(ecmp10).png)](/assets/img/posts/image(ecmp10).png)

### Router R5

[![](/assets/img/posts/image(ecmp11).png)](/assets/img/posts/image(ecmp11).png)

## Langkah 2: Konfigurasi Static Routing

### Router R1

```cisco
ip route 192.168.20.0 255.255.255.0 70.70.70.1
ip route 40.40.40.0 255.255.255.252 10.10.10.2
ip route 50.50.50.0 255.255.255.252 20.20.20.2
ip route 70.70.70.0 255.255.255.252 60.60.60.2
```

### Router R2

```cisco
ip route 192.168.10.0 255.255.255.0 60.60.60.1
ip route 192.168.20.0 255.255.255.0 70.70.70.1
```

### Router R3

```cisco
ip route 192.168.10.0 255.255.255.0 60.60.60.1
ip route 10.10.10.0 255.255.255.252 40.40.40.2
ip route 60.60.60.0 255.255.255.252 70.70.70.2
ip route 20.20.20.0 255.255.255.252 50.50.50.2
```

### Router R4

```cisco
ip route 192.168.10.0 255.255.255.0 20.20.20.1
ip route 192.168.20.0 255.255.255.0 50.50.50.1
```

### Router R5

```cisco
ip route 192.168.10.0 255.255.255.0 10.10.10.1
ip route 192.168.20.0 255.255.255.0 40.40.40.1
```

## Langkah 3: Pengecekan

Lakukan pengujian konektivitas dengan ping dari PC 1 ke Server atau PC 2:

[![](/assets/img/posts/image(ecmp12).png)](/assets/img/posts/image(ecmp12).png)

**Perintah untuk verifikasi:**

```cisco
# Cek routing table
show ip route

# Test konektivitas
ping [destination_ip]

# Trace route untuk melihat jalur yang dilewati
tracert [destination_ip]
```

## Cara Kerja ECMP

Dengan konfigurasi di atas, router akan mendistribusikan traffic secara merata melalui beberapa jalur yang memiliki cost yang sama (equal cost). Keuntungannya:

- ✅ **Load Balancing** - Traffic terdistribusi ke multiple path
- ✅ **Redundancy** - Jika satu link down, traffic otomatis pindah ke jalur lain
- ✅ **Optimalisasi Bandwidth** - Semua link digunakan, tidak ada yang idle
- ✅ **High Availability** - Network tetap berjalan meski ada link failure

## Kesimpulan

Load balancing dengan ECMP menggunakan static route di Cisco dapat meningkatkan performa dan keandalan jaringan. Teknik ini sangat berguna untuk jaringan yang membutuhkan high availability dan optimal bandwidth utilization.

---

Sekian tutorial kali ini, semoga bermanfaat! 😊