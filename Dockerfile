FROM ubuntu:trusty
MAINTAINER Laura Frank <laura.frank@centurylink.com>
CMD while true; do echo 'hello world' | nc -l -p 8888; done
