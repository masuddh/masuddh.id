---
title: "CI/CD Gitlab CI and Google Cloud Run"
date: 2023-08-15 19:11:00 +0700
categories: [Cloud]
tags: [gcp]
---

[![](/assets/img/posts/img-c2d084d2618ae351.jpg)](/assets/img/posts/img-c2d084d2618ae351.jpg)

Dalam catatan kali ini kita akan membuat CI/CD pipeline menggunakan GitLab CI yang akan di-deploy di serverless Google Cloud Run.

## CI/CD?

CI/CD atau Continuous Integration, Continuous Deployment adalah proses otomatis yang digunakan untuk mengembangkan, menguji, dan deploy aplikasi atau proyek. Jadi, CI/CD bikin proses pengembangan aplikasi jadi lebih cepat, mudah, dan bisa mengurangi human error. Konsepnya, setiap kali ada perubahan di kode kita, CI/CD tools akan melakukan build, test, dan deploy otomatis, tanpa harus kita lakukan secara manual. Contoh CI/CD tools adalah Jenkins, GitLab CI, Travis CI, Circle CI, GitHub Action, dan masih banyak yang lainnya.

## GitLab CI?

GitLab CI adalah fitur yang ada di GitLab yang bisa kita gunakan untuk jalankan skrip otomatis setiap kali ada perubahan di repositori Git kita. Biasanya, fitur ini dipakai untuk nge-test, nge-build, dan nge-deploy aplikasi atau projek kita. GitLab CI adalah salah satu tools CI/CD yang lagi ramai digunakan.

## Cloud Run?

Cloud Run adalah layanan dari Google Cloud Platform (GCP) yang memungkinkan kita menjalankan aplikasi container di cloud dengan mudah. Cloud Run mengambil container yang telah kita buat, lalu menjalankannya di server yang disediakan oleh Google. Fitur yang menarik dari Cloud Run adalah kita hanya perlu membayar untuk waktu yang kita gunakan, sehingga kita tidak perlu khawatir tentang biaya yang mungkin timbul saat tidak menggunakannya.

## Prerequisites

- Punya akun GCP, jika belum ada bisa membuat akun trial [disini](https://cloud.google.com/free/docs/free-cloud-features#free-trial)
- Membuat Gitlab repository, contoh kode nya [disini](https://gitlab.com/masuddhh/gitlab-ci-cloudrun)
- Enable Cloud Run API

## Membuat Service Account

Jika sudah, kita bisa memulai dengan membuat **service account** terlebih dahulu:

- Masuk ke menu **IAM & Admin**
- Create **Service Account**

[![](/assets/img/posts/img-ecfbe97e8967466b.jpg)](/assets/img/posts/img-ecfbe97e8967466b.jpg)

- Kemudian download key nya, masuk ke menu **Keys → Add key → Create new key**

[![](/assets/img/posts/img-1790eb97b62817de.jpg)](/assets/img/posts/img-1790eb97b62817de.jpg)

## Menambahkan Variabel di Gitlab

Masuk ke repository gitlab, **Settings → CI/CD → Variables → Add variable**

  

[![](/assets/img/posts/img-4bcabd7a4cf3155e.jpg)](/assets/img/posts/img-4bcabd7a4cf3155e.jpg)

## Menyiapkan Aplikasi

Bagi yang ingin mencoba, silakan clone repository yang sudah saya siapkan. Disini ada aplikasi sederhana menggunakan Node.js, hanya memunculkan "Hello World", namanya juga sederhana.

```bash
git clone https://gitlab.com/masuddhh/gitlab-ci-cloudrun.git
cd gitlab-ci-cloudrun
npm install && npm start
```

Begini tampilanya jika dijalankan di local:

  

[![](/assets/img/posts/img-2785027bc6539240.jpg)](/assets/img/posts/img-2785027bc6539240.jpg)

## Menyiapkan Dockerfile

Dockerfile sederhana untuk aplikasi Node.js:

```dockerfile
# Stage 1: Build the Node.js app
FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create a smaller image
FROM node:14-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
CMD ["node", "app.js"]
```

## Membuat Pipeline GitLab

Untuk membuat pipeline pada GitLab CI kita perlu membuat file `.gitlab-ci.yml`. Ini adalah file yang menjalankan pipeline kita nanti. Disini saya membuat pipeline sederhana dengan stage build dan deploy.

> **Note:** Untuk registry image, saat blog ini dibuat Cloud Run tidak bisa menggunakan Container Registry GitLab, maka dari itu saya push juga ke GCR (Google Container Registry) agar bisa running di Cloud Run.

```yaml
stages:
  - build
  - deploy

variables:
  SERVICE_NAME: simple-app
  GCLOUD_PROJECT_ID: $GCLOUD_PROJECT_ID # Set this in your GitLab project's CI/CD settings
  GCLOUD_SERVICE_KEY: $GCLOUD_SERVICE_KEY # Set this in your GitLab project's CI/CD settings
  IMAGE_TAG: $CI_PIPELINE_IID
  IMAGE_TAG_GCR: gcr.io/$GCLOUD_PROJECT_ID/$CI_PROJECT_NAME:$IMAGE_TAG

build_docker_image:
  stage: build
  image: quay.io/buildah/stable:v1.23.3
  before_script:
    - curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-442.0.0-linux-x86_64.tar.gz
    - tar -xf google-cloud-cli-442.0.0-linux-x86_64.tar.gz
    - ./google-cloud-sdk/install.sh
  script:
    - echo $GCLOUD_SERVICE_KEY > gcloud-service-key.json
    - ./google-cloud-sdk/bin/gcloud auth activate-service-account --key-file gcloud-service-key.json
    - ./google-cloud-sdk/bin/gcloud config set project $GCLOUD_PROJECT_ID
    - export HOME=$CI_BUILDS_DIR
    - buildah login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - cat gcloud-service-key.json | buildah login -u _json_key --password-stdin gcr.io
    - buildah build -t $IMAGE_TAG
    - buildah push $IMAGE_TAG docker://$CI_REGISTRY_IMAGE:$IMAGE_TAG #push to container registry gitlab
    - buildah push $IMAGE_TAG $IMAGE_TAG_GCR #push to google container registry

deploy_to_cloud_run:
  stage: deploy
  image: google/cloud-sdk:latest
  script:
    - echo $GCLOUD_SERVICE_KEY > gcloud-service-key.json
    - gcloud auth activate-service-account --key-file gcloud-service-key.json
    - gcloud config set project $GCLOUD_PROJECT_ID
    - gcloud run deploy $SERVICE_NAME --image $IMAGE_TAG_GCR --region=asia-southeast1 --port 3000 --platform managed --allow-unauthenticated
  only:
    - main
```

## Deploy

Selanjutnya tinggal kita deploy dengan cara melakukan perubahan dan commit ke GitLab repo kita, maka pipeline akan otomatis menjalankan skrip dan memulai proses build dan deploy.

**Build → Pipelines**

[![](/assets/img/posts/img-f7c404f3b9994ac4.jpg)](/assets/img/posts/img-f7c404f3b9994ac4.jpg)

[![](/assets/img/posts/img-cb4829eccacc435d.jpg)](/assets/img/posts/img-cb4829eccacc435d.jpg)

## Cek Hasil

Di stage deploy, jika berhasil akan memunculkan URL dari Cloud Run: 

[![](/assets/img/posts/img-f37efc639ced08ee.jpg)](/assets/img/posts/img-f37efc639ced08ee.jpg)

[![](/assets/img/posts/img-9e98af3b9dd36ea9.jpg)](/assets/img/posts/img-9e98af3b9dd36ea9.jpg)

---

Sekian!