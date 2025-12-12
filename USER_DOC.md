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
## Starting and Stopping the Project
To start the project, follow these steps:
1. Open your terminal or command prompt.
2. Navigate to the project directory.
3. Run the command:
```bash
make
```
To stop the project, use the command:
```bash
make down
```
## Accessing the website:
1. Open your web browser.
2. Navigate to `https://mniemaz.42.fr`
## Accessing the administration panel:
1. Open your web browser.
2. Navigate to `https://mniemaz.42.fr/wp-admin`
3. Log in using the administrator credentials provided during setup.
## Managing Credentials

```
DOMAIN_NAME=mniemaz.42.fr

# MARIADB CONFIG
DB_NAME=wp_db
DB_ROOT_PASSWORD=root
DB_HOST=mariadb
DB_ADMIN_USER=mniemaz
DB_ADMIN_PASSWORD=mniemaz

# WORDPRESS CONFIG
WP_TITLE=Inception mniemaz website
WP_ADMIN_USER=mniemaz
WP_ADMIN_PASSWORD=mniemaz
WP_ADMIN_EMAIL=mniemaz@mniemaz.com
WP_USER_LOGIN=wp_user
WP_USER_EMAIL=wp_user@example.com
WP_USER_PASSWORD=wp_user
```
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
