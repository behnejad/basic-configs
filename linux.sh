# install essentials
sudo apt update
sudo apt install -y vim aria2 htop bmon iotop nginx tmux net-tools ethtool ncdu build-essential openssh-server gparted
sudo apt install -y qemu-system libvirt0 virt-manager guestfs-tools cifs-utils
sudo apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-19-jdk
sudo apt install -y firejail notepadqq
sudo apt install -y nethogs iptraf-ng
# wine, sublime, virtualbox, veracrypt

firejail --dns=1.1.1.1 --net=wlx0024a59c6ea5 --defaultgw=192.168.160.1 aria2c "google.com"

timedatectl set-local-rtc 1
# mount cifs
sudo mount -t cifs -o user=xxx,password=xxx,uid=$(id -u),gid=$(id -g) //192.168.1.1/dir /mnt'
sshfs a@a:/home/a/ /media/remote/

ssh -oHostKeyAlgorithms=+ssh-dss

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

# netplan cloud
network:
    version: 2
    ethernets:
        eth0:
            dhcp4: true
            dhcp6: true
            dhcp6-overrides:
                use-dns: false
            dhcp4-overrides:
                use-dns: false
            nameservers:
              addresses: [94.140.14.14, 94.140.15.15, 2a10:50c0::ad1:ff, 2a10:50c0::ad2:ff]
            match:
                macaddress: fa:16:3e:fc:71:ee
            mtu: 1500
            set-name: eth0

# active directory
%domain\ admins@DOMAIN.COM ALL=(ALL) ALL
sudo apt -y install realmd libnss-sss libpam-sss sssd sssd-tools adcli samba-common-bin oddjob oddjob-mkhomedir packagekit
sudo realm  discover company.com
sudo realm join --user=Administrator  domain.com
sudo pam-auth-update --enable mkhomedir
realm list
sudo realm permit --all
sudo systemctl enable sssd
sudo systemctl start sssd
