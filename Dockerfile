FROM ubuntu:latest

RUN apt-get update && \
	apt-get install -y git gcc libssl-dev make autoconf && \
	git clone https://github.com/Radmind/radmind.git && \
	cd radmind && \
	sh bootstrap.sh && autoconf && cd libsnet && autoconf && cd .. && \
	cp /usr/share/automake*/config.guess . && cp config.guess libsnet && \
	./configure && make && make install && \
	mkdir -p /var/radmind/{cert,client,postapply,preapply}

COPY radmind_start.sh /usr/local/bin/radmind_start.sh

ENTRYPOINT ["/usr/local/bin/radmind_start.sh"]
#ENTRYPOINT ["/bin/sh"]
