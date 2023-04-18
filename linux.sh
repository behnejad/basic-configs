# install essentials
sudo apt update
sudo apt install vim aria2 htop bmon iotop nginx tmux net-tools ncdu build-essential openssh-server gparted 

# mount cifs
sudo mount -t cifs -o user=xxx,password=xxx,uid=$(id -u),gid=$(id -g) //192.168.1.1/dir /mnt'
sshfs a@a:/home/a/ /media/remote/

#journalctl clean
journalctl --vacuum-size=500M
[Journal]
SystemMaxUse=250M
SystemMaxFileSize=50M

# clean caches
echo 3 | sudo tee /proc/sys/vm/drop_caches
