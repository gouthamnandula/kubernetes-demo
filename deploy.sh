set -e

NAME="kubernetes-demo-api"
USERNAME="gouthamnandula"
Image = "$USERNAME/$NAME:latest"

echo "Building Docker Image"
docker build -t $Image .

echo "Pushing Docker Image to Docker Hub"
docker push $Image

echo "Deploying to Kubernetes"
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods"
kubectl get pods

echo "Getting services"
kubectl get services

echo "Fetching the main service"
kubectl get service $NAME-service
