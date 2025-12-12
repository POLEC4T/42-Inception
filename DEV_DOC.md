# Developer Documentation
This document provides instructions for developers on how to set up, build, and manage the development environment for this project.
## Prerequisites
Before setting up the environment, ensure you have the following installed on your machine:
- Docker
- Docker Compose
- Make
## Setting Up the Environment
To set up the environment from scratch, follow these steps:
1. Clone the project repository to your local machine.
2. Navigate to the project directory.
3. Create a `.env` file in the `srcs/` directory with the necessary configuration. Refer to the [Managing Credentials](#Managing-Credentials) section below for details.
## Building and Launching the Project
To build and launch the project using the Makefile and Docker Compose, follow these steps:
1. Open your terminal or command prompt.
2. Navigate to the project directory.
3. Run the command:
```bash
make
```
This command will build the Docker images and start the containers as defined in the `docker-compose.yml` file.
## Managing Containers and Volumes
To manage the containers and volumes, you can use the following commands:
- To stop the project and remove the containers, use:
```bash
make down
```
- To stop the containers and remove the volumes, use:
```bash
make downv
```
- To view the logs of all services, use:
```bash
make logs
```
- To check the status of the running containers, use:
```bash
make ps
```
For more detailed information, you can also check the Makefile at the root of the project.
You can also navigate to the srcs directory and use Docker Compose commands directly, such as:
```bash
docker-compose up -d
docker-compose down
...
```
## Data Persistence
The project data is stored in Docker volumes to ensure persistence across container restarts. They are currently located on the host machine at:
```bash
/home/mniemaz/data/mariadb
/home/mniemaz/data/wordpress
```
You can change this in the docker-compose.yml.
## Managing Credentials
Copy the following .env configuration template and fill in your own credentials:
```bash
DOMAIN_NAME=localhost # localhost or your domain name

# MARIADB CONFIG
DB_NAME=YOUR_DB_NAME
DB_ROOT_PASSWORD=YOUR_ROOT_PASSWORD
DB_HOST=mariadb # This has to be 'mariadb' since it's the service name in docker-compose.yml
DB_ADMIN_USER=YOUR_DB_ADMIN_USER
DB_ADMIN_PASSWORD=YOUR_DB_ADMIN_PASSWORD

# WORDPRESS CONFIG
WP_TITLE=YOUR_WORDPRESS_TITLE
WP_ADMIN_USER=YOUR_ADMIN_USER
WP_ADMIN_PASSWORD=YOUR_ADMIN_PASSWORD
WP_ADMIN_EMAIL=YOUR_ADMIN_EMAIL
WP_USER_LOGIN=YOUR_USER_LOGIN
WP_USER_EMAIL=YOUR_USER_EMAIL
WP_USER_PASSWORD=YOUR_USER_PASSWORD
```