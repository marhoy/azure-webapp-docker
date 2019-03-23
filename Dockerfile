FROM continuumio/miniconda3

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/

# Set up ssh for use with Azure
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd 
COPY sshd_config /etc/ssh/

# Add ssh-key for local testing
ADD add-ssh-key.sh /add-ssh-key.sh
RUN chmod +x /*.sh
RUN /add-ssh-key.sh

COPY init.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/init.sh

EXPOSE 80 2222
ENTRYPOINT ["init.sh"]
