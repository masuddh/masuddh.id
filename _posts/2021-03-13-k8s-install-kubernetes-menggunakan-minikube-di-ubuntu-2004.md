---
title: "K8s : Install Kubernetes Menggunakan Minikube di Ubuntu 20.04"
date: 2021-03-13 05:46:00 +0700
categories: [DevOps]
tags: [kubernetes]
---

Assalamu'alaikum, pada kesempatan kali ini saya akan mencoba menginstall Kubernetes di lokal Ubuntu 20.04 menggunakan Minikube.

Minikube adalah tool open-source yang dapat membantu menyiapkan cluster Kubernetes node dengan mudah. Minikube tidak membutuhkan resource yang banyak. Jadi sangat cocok digunakan untuk pemula, seperti saya hehe..

Oke langsung saja yaa..

> **Prerequisites:** Pastikan sudah menginstall Docker. Klik [disini](https://zimmernet.blogspot.com/2021/02/easy-way-to-install-docker-with-docker.html) jika belum install Docker.

## Install Minikube

Pertama, kita download Minikube dari situs resminya:

```bash
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

[![](/assets/img/posts/image(67).png)](/assets/img/posts/)

Selanjutnya salin ke Path:

```bash
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
```

[![](/assets/img/posts/image(66).png)](/assets/img/posts/)

Kemudian, atur permission nya:

```bash
sudo chmod 755 /usr/local/bin/minikube
```

[![](/assets/img/posts/image(65).png)](/assets/img/posts/)

Cek versi Minikube:

```bash
minikube version
```

[![](/assets/img/posts/image(64).png)](/assets/img/posts/)

## Install Kubectl

Pertama, tambahkan GPG-Key dengan perintah berikut (menggunakan user root):

```bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
```

[![](/assets/img/posts/image(63).png)](/assets/img/posts/)

Selanjutnya, tambahkan repository kubectl:

```bash
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
```

[![](/assets/img/posts/image(62).png)](/assets/img/posts/)

Kemudian update dan install kubectl:

```bash
apt-get update -y
apt-get install kubectl kubeadm -y
```

[![](/assets/img/posts/image(61).png)](/assets/img/posts/)

## Menjalankan Minikube

Setelah semua sudah terinstall, tinggal kita jalankan Minikube dengan perintah:

```bash
minikube start
```

[![](/assets/img/posts/image(60).png)](/assets/img/posts/)

Kita dapat mengecek informasi nodes dan versinya:

```bash
kubectl get nodes
kubectl version
```

[![](/assets/img/posts/image(59).png)](/assets/img/posts/)

## Kesimpulan

Setelah mengikuti langkah diatas, kita telah berhasil menyiapkan cluster Kubernetes di Ubuntu 20.04 dan sudah bisa digunakan untuk mengeksplore Kubernetes secara lokal. Sekian!