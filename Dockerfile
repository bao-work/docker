FROM ubuntu:xenial

ADD sources.list /etc/apt/sources.list
ADD pip.conf /etc/pip.conf

RUN apt-get update
RUN apt-get -y install python3 python3-pip
RUN apt-get clean
RUN pip3 install flask

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ADD app.py /var/www/app.py

WORKDIR /var/www
EXPOSE 5000

RUN mkdir /data
RUN flask create_db
VOLUME ["/data"]

ENTRYPOINT ["flask"]
CMD ["run", "--host", "0.0.0.0"]
