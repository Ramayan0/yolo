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