#! /bin/bash

# Membuat image dari Dockerfile yang ada dalam direktori kerja, image dengan nama moxiu07/karsajobs-ui:latest yang memiliki tag latest.
docker build -t moxiu07/karsajobs-ui:latest . ;

# Membuat sebuah image yang bernama ghcr.io/moxie07/karsajobs-ui:latest yang nantinya merujuk kepada image moxiu07/karsajobs-ui:latest .
docker tag moxiu07/karsajobs-ui:latest ghcr.io/moxie07/karsajobs-ui:latest ;

# Menarik github token dari environment ke STDIN supaya login github packages bisa lebih aman tanpa meninggalkan jejak password di terminal.
printenv $GITHUB_TOKEN_PACKAGES | docker login ghcr.io -u moxie07 --password-stdin ;

# Menguggah image ghcr.io/moxie07/karsajobs-ui:latest ke github packages.
docker push ghcr.io/moxie07/karsajobs-ui:latest ;
