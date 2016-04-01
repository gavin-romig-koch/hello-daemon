
# hello-daemon is an httpd server
#  a very simple

IMAGENAME=hello-daemon
REPONAME=gavinromigkochatredhatdotcom
VERSION=devel

IMAGEIDCMD=sudo docker images -q --no-trunc $(REPONAME)/$(IMAGENAME):$(VERSION)

# hello-daemon serves itself from the container port 8888
# but you must contact it through a host port.  You can use
# any free host port you like.
#   80 is the standard httpd port, but if you are already running
#      some other httpd server there, you can't use it for this
# 8888 is a place where lots of test servers run
# again any host port that isn't already being used for some other
# server is fine.
#
# the '-p $(HOSTPORT):8888' below makes the connection from the
# choosen host port to the container port.
#
# if you want to change the container port, change it in this file
# and in the Dockerfile

HOSTPORT=8888
CONTAINERPORT=8888

CONTAINERNAME=hello-daemon-devel

build: imageidfile

imageidfile: Dockerfile
	make clean
	sudo docker build -t $(REPONAME)/$(IMAGENAME):$(VERSION) .
	echo "$$($(IMAGEIDCMD))" >imageidfile

run:
	sudo docker run --cidfile=containeridfile -d --name $(CONTAINERNAME) -p $(HOSTPORT):$(CONTAINERPORT) $(REPONAME)/$(IMAGENAME):$(VERSION)

test:
	curl localhost:$(HOSTPORT)

stop:
	if [ -e containeridfile ]; then \
	  sudo docker stop $$(cat containeridfile) ; \
	fi

clean: stop
	if [ -e containeridfile ]; then \
	  sudo docker rm $$(cat containeridfile) ; \
	  rm -rf containeridfile ; \
	fi
	if [ -n "$$($(IMAGEIDCMD))" ]; then  \
	  sudo docker rmi $$($(IMAGEIDCMD)) ; \
	fi
	rm -rf imageidfile
