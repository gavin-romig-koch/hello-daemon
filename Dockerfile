FROM ubuntu:trusty
# Copied shamelessly from a similar example by Laura Frank <laura.frank@centurylink.com>
#    Thank you.
CMD while true; do echo 'hello world (v21)' | nc -l -p 8888; done
