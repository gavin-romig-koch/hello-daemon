
IMAGENAME=hello-daemon
CONTAINERNAME=hello-daemon

# hello-daemon is an httpd server
#  a very simple

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

build:
	sudo docker build -t $(IMAGENAME) .

run:
	sudo docker run -d --name $(CONTAINERNAME) -p $(HOSTPORT):$(CONTAINERPORT) $(IMAGENAME)

test:
	curl localhost:$(HOSTPORT)

clean:
	sudo docker kill $(CONTAINERNAME)
	sudo docker rm $(CONTAINERNAME)
	sudo docker rmi $(IMAGENAME)




