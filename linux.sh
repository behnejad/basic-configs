# install essentials
sudo apt update
sudo apt install -y vim aria2 htop bmon iotop nginx tmux net-tools ncdu build-essential openssh-server gparted
sudo apt install -y qemu-system libvirt0 virt-manager guestfs-tools
sudo apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-19-jdk

# install wine, sublime, virtualbox, veracrypt

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

sudo su - ubuntu -c "screen -S jiso -dm java -jar jiso.jar"
