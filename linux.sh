# mount cifs
sudo mount -t cifs -o user=user,password=pwd,uid=$(id -u),gid=$(id -g) //192.168.1.1/dir /mnt'
sshfs a@a:/home/a/ /media/remote/

#journalctl clean
journalctl --vacuum-size=500M
