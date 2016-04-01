
## hello-daemon

### To run and use/test the image straight from DockerHub

To run the image from Dockerhub:

```bash
sudo docker run -d --name hello-daemon -p 8888:8888 gavinromigkochatredhatdotcom/hello-daemon
```

To test/use the running image:

```bash
curl localhost:8888
```

Or more generally: 

```bash
sudo docker run -d --name $CONTAINER_NAME -p $HOST_PORT:8888 gavinromigkochatredhatdotcom/hello-daemon
curl localhost:$HOST_PORT
```
Where
$CONTAINER_NAME should be replaced by some unique name
$HOST_PORT can be replace by any host port that isn't already being used


### To build and test a development version of the image from GitHub

Within a cloned version of Git Repo:

To build a development image:

```bash
make build 
```

To run the development image just built:

```bash
make run
```

To see the running development image do something:

```bash
make test
```

To stop the running development image, delete the running development image, and delete the built development image:

```bash
make clean
```



