### Create the docker image:
```shell
$ docker build -t coffee -f docker/Dockerfile.debian .
```

#### Running the hello world in docker:
```shell
$ docker run -v $(pwd):/root -w /root --rm -it coffee bash
# cd samples
# coffee 00-hello_world.bn
# ./out
Hello from coffee!
Hello from coffee!
Hello from coffee!
```
