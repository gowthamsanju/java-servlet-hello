#!/bin/bash

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/e3l3f0q4
docker build -t java-app .
docker tag java-app:latest public.ecr.aws/e3l3f0q4/java-app:latest
docker push public.ecr.aws/e3l3f0q4/java-app:latest
docker run -d --name jsp -p 8089:8080 public.ecr.aws/e3l3f0q4/java-app:latest
