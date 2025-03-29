#!/bin/bash
#penggunaan echo setelah 1 syntax agar setiap output terlihat terpisah

#Membuat docker image karsajobs dengan tag latest dengan dockerfile dari file dan directory sekarang 
docker build --no-cache -t karsajobs-ui:latest . 
echo

#Melihat image docker dengan nama yang spesifik
docker images | grep karsajobs-ui
echo

#Format sesuai github package
docker tag karsajobs-ui:latest ghcr.io/faisal-666/karsajobs-ui:latest
echo

#Login github package var new_github_token didefinisikan diluar script ini
echo $NEW_GITHUB_TOKEN | docker login ghcr.io -u faisal-666 --password-stdin
echo

#push images
docker push ghcr.io/faisal-666/karsajobs-ui:latest
echo
