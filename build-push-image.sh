#!/usr/bin/env bash
set -eo pipefail

IMAGE="ghcr.io/$USERNAME_GITHUB/orderservice:latest"

echo "🔨 Building Docker image…"
docker build --target production -t "$IMAGE" .

echo "🔐 Logging in to GitHub Container Registry…"
echo "$CR_PAT" | docker login ghcr.io -u "$USERNAME_GITHUB" --password-stdin

echo "📤 Pushing image to $IMAGE…"
docker push "$IMAGE"
