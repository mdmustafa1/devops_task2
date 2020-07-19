FROM centos
RUN yum install wget -y
RUN yum install git -y
RUN yum install sudo -y
RUN yum install java-11-openjdk.x86_64 -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins -y
RUN yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
CMD java -jar /usr/lib/jenkins/jenkins.war
EXPOSE 8080
