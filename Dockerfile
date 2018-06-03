FROM ubuntu:xenial

RUN apt-get update
RUN apt-get -y install python3 python3-pip
RUN apt-get clean
RUN pip3 install flask

ADD sources.list /etc/apt/sources.list
ADD pip.conf /etc/pip.conf
ADD app.py /var/www/app.py

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /var/www
EXPOSE 5000

RUN mkdir /data
RUN flask create_db
VOLUME ["/data"]

ENTRYPOINT ["flask"]
CMD ["run", "--host", "0.0.0.0"]
