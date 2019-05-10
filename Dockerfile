FROM debian
RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates wget curl unzip 
RUN echo  "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" >>/etc/apt/sources.list
RUN curl -fsSL https://download.docker.com/linux/debian/gpg |  apt-key add -
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  &&  apt-get update && apt-get install  --allow-unauthenticated -y oracle-java8-installer
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
RUN apt-get install docker-ce maven -y
RUN apt-get install python python-pip -y
RUN pip install awscli
RUN cd $HOME && wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.11.0/pmd-bin-6.11.0.zip && unzip pmd-bin-6.11.0.zip 
RUN alias pmd="$HOME/pmd-bin-6.11.0/bin/run.sh pmd"
RUN apt-get clean && rm -r /var/lib/apt/lists/*
#CMD ["bash"]
RUN apk add --no-cache ca-certificates && update-ca-certificates
ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
RUN ./microscanner ZDRhNjQyMzQ3Y2Rl 
