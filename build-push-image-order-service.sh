#! /bin/bash

# Membuat image tanpa cache dari Dockerfile dengan target dev yang ada dalam direktori kerja, image dengan nama moxiu07/order-service:latest yang memiliki tag latest.
docker build --no-cache --target dev -t moxiu07/order-service:latest . ;

# Membuat sebuah image yang bernama ghcr.io/moxie07/order-service:latest yang nantinya merujuk kepada image moxiu07/order-service:latest .
docker tag moxiu07/order-service:latest ghcr.io/moxie07/order-service:latest ;

# Menarik github token dari environment ke STDIN supaya login github packages bisa lebih aman tanpa meninggalkan jejak password di terminal.
printenv $GITHUB_TOKEN_PACKAGES | docker login ghcr.io -u moxie07 --password-stdin ;

# Menguggah image ghcr.io/moxie07/order-service:latest ke github packages.
docker push ghcr.io/moxie07/order-service:latest ;
