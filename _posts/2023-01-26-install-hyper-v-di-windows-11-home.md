---
title: "Install Hyper-V di Windows 11 Home"
date: 2023-01-26 09:02:00 +0700
categories: [Tutorial]
tags: [tutorial]
---

[![](/assets/img/posts/hyperv_windows.jpeg)](/assets/img/posts/hyperv_windows.jpeg)

_[source image](https://tictac.id/wp-content/uploads/2020/10/hyperv_windows.jpeg)_

Untuk install Hyper-V di Windows 11 Home, cukup buat file dengan nama `hyperv.txt` di Notepad, lalu copy script berikut:

```batch
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
pause
```

## Langkah-langkah

1. Kemudian **Save** dan **Rename** dengan nama `hyperv.bat`
2. Jalankan dengan **Run as Administrator**
3. Tunggu proses hingga selesai
4. Restart system

And boom!! Hyper-V already installed. Enjoyy 🚀