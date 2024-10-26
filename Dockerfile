FROM alpine:latest
RUN apk update &&\
 apk add openssh-server &&\
 apk add git

# generate sshkeys for sshd
RUN ssh-keygen -A

# create user 'git'
RUN addgroup -S git &&\
 adduser -S git -G git -s /bin/sh &&\
 passwd -d git &&\
 mkdir -p /home/git/.ssh

# copy pubkey
COPY ./ssh_key.pub /home/git/.ssh/authorized_keys
RUN chown -R git:git /home/git/.ssh

# make a repo
RUN mkdir -p /repos/first_repo.git &&\
 git init --bare /repos/first_repo.git &&\
 chown -R git:git /repos

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
