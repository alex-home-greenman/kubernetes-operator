FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update 
RUN apt-get install -y\
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# drop back to the regular jenkins user - good practice
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io
RUN docker run hello-world
RUN groupadd docker
RUN usermod -aG docker jenkins
USER jenkins
RUN docker run hello-world
