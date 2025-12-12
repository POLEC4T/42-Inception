<!-- USER_DOC.md — User documentation This file must explain, in clear and simple
terms, how an end user or administrator can:
◦ Locate and manage credentials.
◦ Check that the services are running correctly. -->

# User Documentation
This document provides instructions for end users and administrators on how to use and manage the services provided by this project.
## Services Provided
This project offers the following services:
- A web application accessible via a web browser.
- An administration panel for managing the application.
## Starting the Project
To start the project, follow these steps:
1. Open your terminal or command prompt.
2. Go to the [Managing Credentials](#Managing-Credentials) section below and create a `.env` file in the `srcs/` directory with your own credentials.
3. Navigate to the project directory.
4. Run the command:
```bash
make
```
## Stopping the Project
To stop the project, use the command:
```bash
make down
```
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
## Accessing the website:
1. Open your web browser.
2. Navigate to `https://<your_domain_name>`
## Accessing the administration panel:
1. Open your web browser.
2. Navigate to `https://<your_domain_name>/wp-admin`
3. Log in with <YOUR_ADMIN_USER> and <YOUR_ADMIN_PASSWORD> you set in the `.env` file.
Put this file in the `srcs/` directory and name it `.env`.
## Checking Service Status
To ensure that the services are running correctly, you can:
1. Use the command:
```bash
make ps
```
This command will display the status of all running containers. You should see "Up" in STATUS column for all services.
2. Verify that the web application is accessible via the web browser.
3. Check the logs for any errors or issues using:
```bash
make logs
```
