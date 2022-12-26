FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y software-properties-common
RUN apt-get install -y python3 python3-pip apache2 apache2-bin libxml2-dev
COPY ./app /app
COPY ./app/000-default.conf /etc/apache2/sites-enabled/

WORKDIR /app/
RUN pip3 install -r requirements.txt
RUN chmod +x /app/init.sh
CMD /app/init.sh