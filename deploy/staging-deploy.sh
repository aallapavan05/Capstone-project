# #!/bin/bash
# docker pull yourdockerhub/backend:latest
# docker pull yourdockerhub/frontend:latest
# docker-compose -f docker-compose.staging.yml down
# docker-compose -f docker-compose.staging.yml up -d

#!/bin/bash
set -e

echo "Pull latest images"
docker pull namburisai/backend:latest
docker pull namburisai/frontend:latest

echo "Stopping old containers"
docker-compose -f docker-compose.staging.yml down

echo "Starting new containers"
docker-compose -f docker-compose.staging.yml up -d

echo "Running database migrations"
docker exec capstone-project-backend-1 npm run migrate

echo "Verifying deployment"
curl -f http://localhost:5001/health

echo "Deployment successful"
