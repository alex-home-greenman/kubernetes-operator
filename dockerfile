FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update &&  apt-get install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get  update
RUN apt-get install -y kubectl
RUN kubectl version --client

USER jenkins
