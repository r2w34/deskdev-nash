# OpenHands Deployment Guide

This document provides instructions for deploying OpenHands using Dokploy.

## Deployment Configuration

When deploying with Dokploy, use the following configuration:

### GitHub Account
- Use your GitHub account where the repository is hosted

### Repository
- Select the repository containing the OpenHands code

### Branch
- Select the branch you want to deploy (typically `main` or `master`)

### Build Path / Trigger Type
- Select "On Push"

### Watch Paths
- Leave empty to watch all files, or specify paths like `frontend/**` if you only want to trigger builds on frontend changes

### Build Type
- Select "Dockerfile"

### Docker File
- Use `containers/app/Dockerfile`

### Docker Context Path
- Use `.` (root of the repository)

### Docker Build Stage
- Leave empty to use the default stage

## Environment Variables

The following environment variables can be configured in Dokploy:

- `SANDBOX_RUNTIME_CONTAINER_IMAGE`: The container image for the sandbox runtime (default: `docker.all-hands.dev/all-hands-ai/runtime:0.48-nikolaik`)
- `SANDBOX_USER_ID`: The user ID to run the sandbox as (default: `0` for root)
- `WORKSPACE_MOUNT_PATH`: The path to mount the workspace (optional)

## Ports

The application exposes port 3000, which should be mapped to your desired external port in Dokploy.

## Additional Notes

- The application requires Docker socket access for creating sandbox containers. Ensure your Dokploy configuration allows this.
- For production deployments, consider setting up proper authentication and HTTPS.