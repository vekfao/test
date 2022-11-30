/bin/bash
nginx
sleep 1
/usr/sbin/sshd
sleep 1
./tunnelc -proxy 0.0.0.0:22 -tunnel 198.23.174.25:13100
