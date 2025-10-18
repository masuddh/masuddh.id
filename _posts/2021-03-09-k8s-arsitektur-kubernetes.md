---
title: "K8s : Arsitektur Kubernetes"
date: 2021-03-09 16:56:00 +0700
categories: [DevOps]
tags: [kubernetes]
---

[![](/assets/img/posts/arsitektur+kubernetes.png)](/assets/img/posts/arsitektur+kubernetes.png)

Kali ini kita akan membahas tentang arsitektur Kubernetes. Seperti gambar di atas, ketika kita menjalankan Kubernetes, maka akan menjalankan satu buah cluster. Dalam satu cluster ada komponen utama yang terdiri dari **Kubernetes Master** dan **Kubernetes Node/Minions**.

Di dalam master maupun node ada beberapa system yang berjalan diantaranya adalah sebagai berikut:

## Kubernetes Master

- **kube-controller-manager** - Bertugas untuk mengawasi kontrol dari Kubernetes cluster
- **etcd** - Sebagai database atau penyimpanan data dalam Kubernetes cluster
- **kube-apiserver** - Digunakan sebagai API yang berfungsi untuk berkomunikasi dengan Kubernetes cluster
- **kube-scheduler** - Bertugas untuk mengawasi aplikasi yang dijalankan dan meminta node untuk menjalankan aplikasi
- **cloud-controller-manager** - Bertugas untuk melakukan kontrol terhadap provider cloud

## Kubernetes Node

- **kubelet** - Bertugas untuk memastikan bahwa aplikasi kita berjalan dengan lancar di node
- **kube-proxy** - Bertugas sebagai proxy dan load balancer terhadap arus network yang masuk ke aplikasi kita
- **container-manager** - Bertugas sebagai container manager. Contoh container manager yang didukung Kubernetes adalah Docker, containerd, CRI-O, dll.

---

Itulah arsitektur yang berjalan di Kubernetes. Sekian!