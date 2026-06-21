#!/bin/sh
set -e

NAME="kubernetes-demo-api"
USERNAME="gouthamnandula"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker Image"
docker build -t "$IMAGE" .

echo "Pushing Docker Image to Docker Hub"
docker push "$IMAGE"

echo "Deploying to Kubernetes"
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods"
kubectl get pods

echo "Getting services"
kubectl get services

SERVICE_NAME="devops-kubernetes-api-service"

echo "Fetching the main service"
kubectl get service "$SERVICE_NAME"