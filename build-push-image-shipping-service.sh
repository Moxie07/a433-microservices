#! /bin/bash

# Membuat image tanpa cache dari Dockerfile dengan target dev yang ada dalam direktori kerja, image dengan nama moxiu07/shipping-service:latest yang memiliki tag latest.
docker build --no-cache --target dev -t moxiu07/shipping-service:latest . ;

# Membuat sebuah image yang bernama ghcr.io/moxie07/shipping-service:latest yang nantinya merujuk kepada image moxiu07/shipping-service:latest .
docker tag moxiu07/shipping-service:latest ghcr.io/moxie07/shipping-service:latest ;

# Menarik github token dari environment ke STDIN supaya login github packages bisa lebih aman tanpa meninggalkan jejak password di terminal.
printenv $GITHUB_TOKEN_PACKAGES | docker login ghcr.io -u moxie07 --password-stdin ;

# Menguggah image ghcr.io/moxie07/shipping-service:latest ke github packages.
docker push ghcr.io/moxie07/shipping-service:latest ;
