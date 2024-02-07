### DCOM 142 Lab Practical ###

#!/bin/bash


sudo useradd -m homer
sudo useradd -m marge
sudo passwd homer <<< "ab!@CD12"
sudo passwd marge <<< "ab!@CD12"
sudo passwd -l marge


sudo groupadd simpsons
sudo groupadd ccbc
sudo usermod -aG simpsons homer
sudo usermod -aG simpsons marge
sudo usermod -aG ccbc student


sudo mkdir /home/student/final
sudo chown :simpsons /home/student/final


sudo chmod 700 /home/student/final
sudo chmod g+s /home/student/final


cd /home/student/final
sudo cp /etc/passwd /etc/shadow /etc/group .

sudo chown student:ccbc passwd shadow group



sudo service apache2 status > apache2.txt
sudo service apache2 stop
sudo service apache2 start
ps -ef | grep -w apache2 >> process.txt


free -m | grep Mem | awk '{print $2}' > memory.txt
lscpu | grep "^CPU(s):" | awk '{print $2}' > cpu.txt

ip addr show | grep "inet " | awk '{print $2}' > network.txt
ping -c4 www.google.com >> network.txt
ip route show default | awk '{print $3}' >> network.txt
cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' >> network.txt

cat <<EOF > simple.sh
#!/bin/bash
fakename="Mickey Mouse"
read -p "Enter your name: " realname
echo "Hello $fakename"
echo "I know you, your real name is $realname"
echo "Nice talking to you $realname"
echo "Goodbye!!!"
EOF
chmod +x simple.sh

./simple.sh | tee simple.txt

ln /home/student/final/passwd /home/student/final/hlink
ln -s /home/student/final/group /home/student/final/slink
ls -li /home/student/final > links.txt


cd ~
cp ~/.bash_history ~/final/history.txt
ls -l ~/final


tar -cjvpf ~/jhoffmann_final_project.tar.bz2 final

