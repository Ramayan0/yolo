# YOLO E-Commerce Application Deployment

This project automates the deployment of the YOLO E-Commerce application using Docker, Ansible, and GitHub. The architecture includes:

- **Frontend**: React-based client application.
- **Backend**: Node.js server connected to MongoDB.
- **MongoDB**: Database for managing e-commerce data.

## Features

1. **Automated Deployment**: Use Ansible to orchestrate the setup of the frontend, backend, and database.
2. **Containerized Environment**: Docker containers ensure a consistent and isolated runtime.
3. **Custom Docker Network**: Containers communicate via a dedicated network for enhanced security and performance.

## Prerequisites

Ensure the following are installed on the host machine:

1. [Ansible](https://docs.ansible.com/)
2. [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/)
3. Git

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/Ramayan0/yolo.git
cd yolo

```

### Start the Vagrant Machine
```bash
vagrant up

```

- This will initialize a virtual machine using Vagrant and configure SSH access.

### Prepare the Inventory File
- The inventory.yml file is pre-configured with the following content:

```bash
all:
  hosts:
    myserver:
      ansible_host: 127.0.0.1
      ansible_port: 2222
      ansible_user: vagrant
      ansible_private_key_file: .vagrant/machines/default/virtualbox/private_key

```
### Run the Ansible Playbook
- Deploy the platform by running:

```bash
ansible-playbook -i inventory.yml playbook.yml
```
### Access the Application

Frontend: Open http://127.0.0.1:3000 in your browser.
Backend API: Available at http://127.0.0.1:5000.
MongoDB: Runs internally on port 27017.

### Verify Persistence
- Add products to the e-commerce platform via the frontend.
- Restart the backend or database using Docker and confirm that the data persists.

## File Structure
```bash
.
├── README.md
├── explanation.md
├── inventory.yml
├── playbook.yml
├── roles/
│   ├── backend-deployment/
│   │   ├── tasks/
│   │   │   └── main.yml
│   ├── frontend-deployment/
│   │   ├── tasks/
│   │   │   └── main.yml
│   ├── setup-mongodb/
│   │   ├── tasks/
│   │   │   └── main.yml
```
## MongoDB Persistence
- MongoDB data is stored in a Docker volume to ensure persistence across   container restarts. This is configured in the setup-mongodb role.

## Additional Notes
- Ensure that hamsahassan/yolo-client:1.0 and hamsahassan/yolo-backend:1.0 - - Docker images are up-to-date.
- Any changes to the MongoDB URI or frontend-backend communication should be - updated in the playbook and Docker environment variables.