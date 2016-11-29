#
#
#Version 0.0.1
#

FROM fedora:23

MAINTAINER RABAH GUITTOUNE

#Updating system &&Installing basic tools
RUN dnf -y update \
    && dnf install -y tar \
    && python3 -V \
    && dnf install -y git python-pip \
    && python3 -m pip install -U pip \

COPY requirements.txt /
RUN  pip3 install -r /requirements.txt

RUN mkdir -p /home/dev/web_server_flask
WORKDIR /home/dev/web_server_flask
COPY hello.py .
COPY README.md web_server_flask
ADD templates /home/dev/web_server_flask/templates
ADD static /home/dev/web_server_flask/static

EXPOSE 5000

#Clean-up
run dnf clean all
#Move in web_server dir
WORKDIR /home/py_dev/
#CMD python3 hello.py runserver
ENTRYPOINT ["python3","hello.py","runserver"]
CMD ["-h=0.0.0.0"]

