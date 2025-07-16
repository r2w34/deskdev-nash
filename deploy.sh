#!/bin/bash
set -e

# Build and run the OpenHands application
docker build -t openhands:latest -f ./containers/app/Dockerfile .

# Run the container
docker run -d \
  --name openhands-app \
  -p 3000:3000 \
  -e SANDBOX_RUNTIME_CONTAINER_IMAGE=docker.all-hands.dev/all-hands-ai/runtime:0.48-nikolaik \
  -e SANDBOX_USER_ID=0 \
  --restart unless-stopped \
  openhands:latest