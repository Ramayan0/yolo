# Yolo Application Deployment on Google Kubernetes Engine (GKE)

This repository contains the Kubernetes manifests and configurations for deploying the Yolo application on Google Kubernetes Engine (GKE). The application consists of a backend (Node.js with Express), a MongoDB database (deployed as a StatefulSet), and a frontend.

## Project Overview

The goal of this project is to deploy a scalable, reliable application using Kubernetes. The application is composed of:
- A backend service that exposes a REST API to interact with the products and shopping cart.
- A MongoDB database that stores the products and cart data.
- A frontend (React.js) that communicates with the backend.

## Prerequisites

Before deploying the application on GKE, make sure you have the following:
- A Google Cloud account with access to GKE.
- A Kubernetes cluster running on GKE.
- `kubectl` installed and configured to use your GKE cluster.
- Docker images for the backend and frontend pushed to your container registry (e.g., Docker Hub or Google Container Registry).
- The required YAML manifests to deploy the application.

## Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Ramayan0/yolo
   cd yolo-kubernetes
```
2. **Update Kubernetes Manifests:**

Modify the following in the Kubernetes manifests:

- Ensure the MongoDB service URL in the backend deployment matches the external IP of the MongoDB LoadBalancer service.
- Ensure the Docker images in the backend and frontend deployments are correctly referenced with the appropriate tags.

3. **Deploy MongoDB StatefulSet:**

Deploy MongoDB as a StatefulSet to ensure data persistence.

```bash
kubectl apply -f manifests/mongo-statefulset.yaml
```

4. **Deploy Backend:**

Deploy the backend application.

```bash
kubectl apply -f manifests/backend-deployment.yaml
```
5. **Deploy Frontend:**

Deploy the frontend application.

```bash

kubectl apply -f manifests/frontend-deployment.yaml
```

6. **Expose Services:**

Expose the MongoDB service using a LoadBalancer and ensure the backend and frontend are accessible.

```bash
kubectl apply -f manifests/hamsa-mongo-lb.yaml
kubectl apply -f manifests/backend-service.yaml
kubectl apply -f manifests/frontend-service.yaml
```

7. **Verify the Deployment:**

Check the status of the pods and services to ensure everything is running correctly.

```bash
kubectl get pods
kubectl get svc
```

8. **Access the Application:**

- The frontend will be available via the external IP of the frontend LoadBalancer.
- The backend service is exposed through the backend service URL.
- MongoDB is accessible through the MongoDB LoadBalancer IP.

9. Troubleshooting:

Pods not starting: Check the logs for more details.

```bash
kubectl logs <pod-name>
```
- MongoDB connection errors: Ensure the backend is pointing to the correct MongoDB service URL.
- Frontend not loading: Check the network policy and ensure the frontend can reach the backend.
## Live Application
You can access the live application at: http://<frontend-ip>:<port>


