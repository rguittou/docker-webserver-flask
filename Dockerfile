#
#
#Version 0.0.1
#

From fedora:23
MAINTAINER RABAH GUITTOUNE

#Updating system
run dnf -y update

#Installing basic tools
run dnf install -y tar

#Print python version
run python3 -V

#Installing git
run dnf install -y git

#Installing python and Basic Python tools
run yum  install -y  python-pip

#iNSTALLING PIP3
run python3 -m pip install -U pip

# Download and install Flask framework
run pip3 install flask

#Install flask_script
run pip3 install flask_script

#Install flask_bootstrap
run pip3 install flask_bootstrap

#Install flask_moment
run pip3 install flask_moment

#Install flask_wtf
run pip3 install flask_wtf

#Create python dev dir
run mkdir /home/py_dev
#Move in py_dir
run cd /home/py_dev/

run git clone https://github.com/astondevops/web_server_flask.git /home/py_dev/

#Expose ports
EXPOSE 5000

#Clean-up
run dnf clean all

#Move in web_server dir
WORKDIR /home/py_dev/
#CMD python3 hello.py runserver
ENTRYPOINT ["python3","hello.py","runserver"]
#ENTRYPOINT ["python3","hello.py","runserver",-h:0.0.0.0]
