FROM adoptopenjdk:8

VOLUME [ "/git" ]

RUN apt-get update && \
    apt-get clean

RUN apt-get install -y expect git gnupg2 subversion sudo vim wget && \
    apt-get clean

# Unminimize
RUN yes | unminimize

# Git
COPY private/gitconfig_user /root/.gitconfig_user
COPY public/gitconfig /root/.gitconfig
RUN curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /root/.git-prompt.sh
COPY public/bashrc /tmp/bashrc
RUN cat /tmp/bashrc > /root/.bashrc && \
    rm /tmp/bashrc
RUN curl --output /tmp/delta.deb --location https://github.com/dandavison/delta/releases/download/0.4.4/git-delta_0.4.4_amd64.deb && \
    dpkg -i /tmp/delta.deb && \
    rm /tmp/delta.deb

# GPG
COPY public/gpg.conf private/private.gpg /root/.gnupg/
RUN chmod -R 600 /root/.gnupg/ && \
    gpg --batch --import /root/.gnupg/private.gpg && \
    rm /root/.gnupg/private.gpg && \
    KEYID=$(gpg --list-secret-keys --with-colons | awk -F: '/^sec:/ { print $5 }') && \
    expect -c "spawn gpg --edit-key ${KEYID} trust quit; send \"5\ry\r\"; expect eof"

# Maven
COPY private/settings.xml private/settings-security.xml /root/.m2/
COPY public/mavenrc /root/.mavenrc

COPY public/clone-camel.sh /root/clone-camel.sh
RUN chmod +x /root/clone-camel.sh
