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
2. Navigate to `http://mniemaz.42.fr`
## Accessing the administration panel:
1. Open your web browser.
2. Navigate to `http://mniemaz.42.fr/wp-admin`
3. Log in using the administrator credentials provided during setup.
## Managing Credentials
Credentials for accessing the administration panel are typically set during the installation process. If you need to locate or manage these credentials:
1. Check the installation documentation for default credentials.
2. If you have changed the credentials, refer to your records or contact the system administrator.
3. To reset the password, use the "Forgot Password" link on the login page of the administration panel.
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
