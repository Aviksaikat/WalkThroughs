FROM alpine:3.7

RUN apk add --update --no-cache \
	python2 \ 
	socat 

ENV USER challenge

RUN adduser -D -u 1000 challenge

COPY . /home/challenge/
COPY flag.txt /home/challenge/

WORKDIR /home/challenge

RUN chmod 644 flag.txt
RUN chown -R root:root /home/challenge

USER challenge

CMD ["socat", "TCP-LISTEN:9999,reuseaddr,fork", "EXEC:'/usr/bin/python /home/challenge/server.py',pty,stderr"]
