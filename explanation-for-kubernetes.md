
### `Explanation.md`

```markdown
# Project Explanation

## 1. **Choice of Kubernetes Objects**

In this project, I used several key Kubernetes objects to orchestrate the deployment of the Yolo application:

- **StatefulSet for MongoDB**: I chose to use a StatefulSet for MongoDB because it provides unique network identities for each pod and ensures that data is persistent. Unlike a ReplicaSet, StatefulSets maintain a stable network identity and guarantee that data is preserved even if a pod is deleted. This is crucial for a database like MongoDB, where the loss of data can have serious consequences.
  
- **Deployment for Backend**: I used a Kubernetes Deployment for the backend to manage replicas and ensure the application remains highly available. The Deployment automatically ensures that the specified number of replicas are always running.

- **Service for Exposing Pods**: I used a LoadBalancer service to expose both the MongoDB and backend services to external traffic. The MongoDB service is exposed using a LoadBalancer so that the backend can access it externally, while the frontend service is exposed similarly to ensure user accessibility.


## 2. **Persistent Storage**

To ensure data persistence for the MongoDB database, I used Kubernetes Persistent Volumes (PV) and Persistent Volume Claims (PVC). When MongoDB is deployed as a StatefulSet, it automatically manages the volume claim for each pod. This guarantees that even if the MongoDB pod is deleted and recreated, the data stored in the volume persists, preventing data loss.

- The `volumeClaimTemplates` section in the StatefulSet manifest ensures that MongoDB pods use a persistent disk from Google Cloud, which is automatically created as a Persistent Volume.

- Without this persistent storage, any restart of the MongoDB pod would result in the loss of all data.

## 3. **Exposing Pods**

To expose the services externally, I used Kubernetes LoadBalancer services. This is particularly useful when running the application on Google Cloud as it provisions an external IP address that can be accessed from anywhere.

- The MongoDB service is exposed using a LoadBalancer service so that the backend can communicate with it externally.
- Similarly, the backend and frontend services are exposed via LoadBalancer to ensure that the user can access the application and interact with the backend.

## 4. **Challenges and Solutions**

- **Networking**: One of the challenges I faced was ensuring the backend and MongoDB pods could communicate correctly within the GKE cluster. Initially, there were connection errors because the backend was not pointing to the correct MongoDB URL. I solved this by updating the backend deployment to use the correct service URL for MongoDB, which is exposed via a LoadBalancer.

- **Persistent Storage Setup**: Configuring persistent volumes for MongoDB was another challenge. The volume needs to be created automatically, and the StatefulSet's `volumeClaimTemplate` ensures this. I also had to make sure that the storage class is compatible with GKE's persistent disk storage.

- **Testing**: Once everything was deployed, I tested the application by interacting with the backend API through the frontend. I also checked if MongoDB data persisted after pod restarts by deleting the MongoDB pod and verifying that the data remained intact.

---

## Conclusion

In this project, I successfully deployed the Yolo application on Google Kubernetes Engine, leveraging StatefulSets for the MongoDB database, Persistent Volumes for data persistence, and LoadBalancer services for exposing the application to the internet. The application is now fully scalable, reliable, and accessible from external networks.

