## Download Kali Linux Image

First, download kali-linux image from the official:

```
docker pull kalilinux/kali-linux-docker
```

Check if the download is successful:

```
docker run -t -i kalilinux/kali-linux-docker /bin/bash
```

Modidy the config if necessary in the `Dockerfile`:

```
ENV username kali
ENV password 12345678
```

Start building with your own build:

```
docker build -t my_kali -f Dockerfile .
```
