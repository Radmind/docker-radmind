FROM ubuntu:latest AS builder

RUN apt-get update && \
	apt-get install -y libssl-dev git gcc make autoconf wget && \
	git clone https://github.com/Radmind/radmind.git && \
	cd radmind && sh bootstrap.sh && \
	wget -O config.sub 'https://git.savannah.gnu.org/cgit/config.git/plain/config.sub' && \
	wget -O config.guess 'https://git.savannah.gnu.org/cgit/config.git/plain/config.guess' && \
	cp config.guess libsnet && cp config.sub libsnet && \
	autoconf && cd libsnet && autoconf && cd .. && \
	./configure && make && make install && \
	mkdir -p /var/radmind/{cert,client,postapply,preapply}

FROM ubuntu:latest

RUN apt-get update && apt-get install -y libssl-dev

COPY --from=builder /usr/local/ /usr/local/

COPY entrypoint /usr/local/bin/entrypoint

RUN apt-get -y install rsyslog
ADD ./50-default.conf /etc/rsyslog.d/50-default.conf
COPY rsyslog/systemd/rsyslog.service /systemd/rsyslog.service

ENTRYPOINT ["/usr/local/bin/entrypoint"]