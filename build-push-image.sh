#! /bin/bash

# Membuat image dari Dockerfile yang ada dalam direktori kerja, image dengan nama item-app yang memiliki tag v1.
docker build -t item-app:v1 . ;

# Melihat daftar image yang ada di lokal secara keseluruhan, guna memastikan berhasil tidaknya dalam membuat image.
docker image ls --all ;

# Membuat sebuah image yang bernama ghcr.io/moxie07/item-app:v1 yang nantinya merujuk kepada image item-app:v1 .
docker tag item-app:v1 ghcr.io/moxie07/item-app:v1 ;

# Menarik github token dari environment ke STDIN supaya login github packages bisa lebih aman tanpa meninggalkan jejak password di terminal.
printf $GITHUB_TOKEN_PACKAGES | docker login ghcr.io -u moxie07 --password-stdin ;

# Menguggah image item-app:v1 ke github packages.
docker push ghcr.io/moxie07/item-app:v1 ;
