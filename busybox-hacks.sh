busybox tcpsvd -vE 0.0.0.0 2121 ./busybox ftpd -Awv /
busybox httpd -p 8080 -f -h / -vv
busybox telnetd -l /bin/xlogin -p 2323 -F

# busybox nc -ll -p 2323 -e /bin/sh
# https://busybox.net/downloads/binaries
