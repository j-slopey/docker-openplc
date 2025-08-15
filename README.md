Clone the repo, cd into it, and perform the following command to build the docker image:
```
docker build -t docker-openplc .
```
To run:
```
docker run -d --privileged -p 8080:8080 -p 502:502 --name openplc docker-openplc
```

(Have not progressed to the point of making a volume)
