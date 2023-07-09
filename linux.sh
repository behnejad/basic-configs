# install essentials
sudo apt update
sudo apt install -y vim aria2 htop bmon iotop nginx tmux net-tools ethtool ncdu build-essential openssh-server gparted
sudo apt install -y qemu-system libvirt0 virt-manager guestfs-tools cifs-utils
sudo apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-19-jdk
sudo apt install -y firejail notepadqq
# wine, sublime, virtualbox, veracrypt

firejail --dns=1.1.1.1 --net=wlx0024a59c6ea5 --defaultgw=192.168.160.1 aria2c "google.com"

timedatectl set-local-rtc 1
# mount cifs
sudo mount -t cifs -o user=xxx,password=xxx,uid=$(id -u),gid=$(id -g) //192.168.1.1/dir /mnt'
sshfs a@a:/home/a/ /media/remote/

sudo mount -t ntfs -o rw,windows_names,norecover,big_writes,streams_interface=windows,inherit /dev/sdc1 /mnt

# overlay fs
cd /tmp
mkdir lower upper workdir overlay
sudo mount -t overlay -o \
lowerdir=/tmp/lower,\
upperdir=/tmp/upper,\
workdir=/tmp/workdir \
none /tmp/overlay

sudo sysctl -w net.ipv4.ip_forward=1
echo 1 > /proc/sys/net/ipv4/ip_forward
sudo nano /etc/sysctl.conf
sudo sysctl -p

#journalctl clean
journalctl --vacuum-size=500M
[Journal]
SystemMaxUse=250M
SystemMaxFileSize=50M

# clean caches
echo 3 | sudo tee /proc/sys/vm/drop_caches

sudo su - ubuntu -c "screen -S jiso -dm java -jar jiso.jar"
hivexregedit --export NTUSER.DAT "Software\Google\Chrome\PreferenceMACs" > chrome.key

# number of open files
ulimit -a
ulimit -n 16384
ulimit -Sn/-Hn
cat /proc/sys/fs/file-max
sysctl -w fs.file-max=500000

/etc/security/limits.conf
/etc/sysctl.conf
soft nofile 65536
hard nofile 65536
marin        hard nofile 4096
marin        soft nofile 1024
