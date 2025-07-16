# OpenHands Deployment Guide for Dokploy

This guide will help you deploy OpenHands (formerly OpenDevin) on your server using Dokploy.

## Prerequisites

- A server with Dokploy installed
- At least 4GB RAM and 2+ CPU cores (recommended for builders)
- Docker installed on your server
- GitHub repository access

## Dokploy Configuration

### 1. Repository Settings

- **GitHub Account**: Your GitHub username or organization
- **Repository**: `deskdev-nash` (or your forked repository name)
- **Branch**: `main`
- **Build Path**: `/` (root directory)

### 2. Trigger Configuration

- **Trigger Type**: `On Push`
- **Watch Paths**: Leave empty to watch all files, or specify:
  - `openhands/**`
  - `frontend/**`
  - `containers/**`
  - `pyproject.toml`
  - `poetry.lock`
  - `Dockerfile`

### 3. Build Configuration

- **Build Type**: `Dockerfile`
- **Docker File**: `Dockerfile.dokploy` (the simplified Dockerfile for Dokploy)
- **Docker Context Path**: `.` (current directory)
- **Docker Build Stage**: Leave empty (no specific stage needed)

### 4. Environment Variables

Set the following environment variables in Dokploy:

#### Required Variables
```bash
FILE_STORE=local
FILE_STORE_PATH=/app/data
```

#### Optional Variables
```bash
# For custom OpenAI API
OPENAI_API_KEY=your_openai_api_key_here

# For custom model configurations
LLM_MODEL=gpt-4
LLM_API_VERSION=2023-05-15

# For debugging
DEBUG=false
LOG_LEVEL=INFO

# For custom workspace
WORKSPACE_MOUNT_PATH=/opt/workspace_base
```

### 5. Port Configuration

- **Container Port**: `3000`
- **Host Port**: `3000` (or any available port on your server)

### 6. Volume Mounts (Optional)

For persistent storage, you can configure this volume in Dokploy:

```bash
# For persistent data
/path/on/host/data:/app/data
```

Note: The simplified Dockerfile.dokploy doesn't require Docker-in-Docker functionality, making it more compatible with Dokploy's restrictions.

## Deployment Steps

1. **Create New Application** in Dokploy
2. **Select "GitHub"** as the source
3. **Configure Repository** settings as described above
4. **Set Build Type** to "Dockerfile"
5. **Add Environment Variables** as listed above
6. **Configure Port Mapping** (3000:3000)
7. **Add Volume Mounts** if needed
8. **Deploy** the application

## Post-Deployment

### Accessing OpenHands

Once deployed, you can access OpenHands at:
```
http://your-server-ip:3000
```

### Health Check

You can verify the deployment by checking:
```bash
curl http://your-server-ip:3000/health
```

### Logs

Monitor the application logs through Dokploy's interface or via Docker:
```bash
docker logs <container-name>
```

## Troubleshooting

### Common Issues

1. **Build Fails**: 
   - Ensure your server has enough resources (4GB+ RAM)
   - Check if all dependencies are properly installed

2. **Container Won't Start**:
   - Verify environment variables are set correctly
   - Check port conflicts

3. **Permission Issues**:
   - Ensure Docker socket permissions are correct
   - Check volume mount permissions

4. **Memory Issues**:
   - Increase server resources
   - Consider using a smaller base image

### Resource Requirements

- **Minimum**: 2GB RAM, 1 CPU core
- **Recommended**: 4GB+ RAM, 2+ CPU cores
- **Storage**: 10GB+ for application and workspace

## Security Considerations

1. **Environment Variables**: Store sensitive data like API keys securely
2. **Network**: Consider using a reverse proxy with SSL
3. **Updates**: Regularly update the container image
4. **Monitoring**: Set up monitoring and alerting

## Scaling

For production environments:
- Use a load balancer for multiple instances
- Consider using external storage for workspace persistence
- Implement proper backup strategies
- Monitor resource usage and scale accordingly

## Support

For issues specific to OpenHands, visit:
- [OpenHands Documentation](https://docs.all-hands.dev)
- [GitHub Issues](https://github.com/All-Hands-AI/OpenHands/issues)
- [Community Slack](https://join.slack.com/t/openhands-ai/shared_invite/zt-3847of6xi-xuYJIPa6YIPg4ElbDWbtSA)