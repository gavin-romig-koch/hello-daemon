
build:
	sudo docker build -t hello .

run:
	sudo docker run -d --name hello -p 80:8888 hello

test:
	curl localhost

clean:
	sudo docker kill hello
	sudo docker rm hello



