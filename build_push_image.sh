#!/bin/bash

set -e # Berhenti dan keluar menjalankan script bila terjadi error

echo "Building Docker Image..." # Print command apa yang akan dilakukan
docker build -t item-app:v1 . # Membuat docker image dari Dockerfile di direktori saat ini

echo -e "\nShowing Docker Images List..." # Print command apa yang akan dilakukan
docker images # Menampilkan image docker yang ada di lokal

echo -e "\nChanging image name to GitHub Packages format..." # Print command apa yang akan dilakukan
docker tag item-app:v1 ghcr.io/zaidanrizq/item-app:v1 # Mengubah nama image agar sesuai format GitHub Packages

echo -e "\nLogging in to GitHub Packages..." # Print command apa yang akan dilakukan
echo $CR_PAT | docker login ghcr.io -u zaidanrizq --password-stdin

echo -e "\nPushing image to GitHub Packages..." # Print command apa yang akan dilakukan
docker push ghcr.io/zaidanrizq/item-app:v1
