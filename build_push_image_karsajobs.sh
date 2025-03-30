#!/bin/sh

# Set konfigurasi keluar dari script bila ada error
set -e

# Build image dari Dockerfile
echo "Building Docker Image..."
docker build -t ghcri.io/zaidanrizq/karsajobs:latest .


# Login ke GitHub Container Registry
echo -e "\nLogin to GitHub Container Registry..."
echo $CR_PAT | docker login ghcr.io -u $USERNAME --password-stdin

# Push Docker Image ke GitHub Container Registry
echo -e "\nPushing Image to GitHub Container Registry..."
docker push ghcr.io/zaidanrizq/karsajobs:latest
