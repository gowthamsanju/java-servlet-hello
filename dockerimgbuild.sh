#!/bin/bash

docker-compose down
docker rm -f $(docker ps -a -q)
docker rmi $(docker images -q)
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/e3l3f0q4
docker build -t java-app .
docker tag java-app:latest public.ecr.aws/e3l3f0q4/java-app:latest
docker push public.ecr.aws/e3l3f0q4/java-app:latest
docker run -it --name jsp -p 80:80 public.ecr.aws/e3l3f0q4/java-app:latest /bin/bash
