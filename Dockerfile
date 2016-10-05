FROM kalilinux/kali-linux-docker
MAINTAINER Adler Hsieh

# docker pull kalilinux/kali-linux-docker
# docker run -t -i kalilinux/kali-linux-docker /bin/bash
# apt-get install metasploit

# Comments
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install python3.5
