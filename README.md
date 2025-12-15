# Inception
*This project has been created as part of the 42 curriculum by mniemaz.*
## Description
Inception is a project that involves setting up a web application environment using Docker and Docker Compose. The goal is to discover the world of containerization, learn how to manage multi-container applications, and understand the benefits of using Docker for development and deployment.
## Technique description
### Use of docker
Docker is a contenerization service allowing the developper to create a `container` with everything a project needs to run, such as specific versions dependencies, specific versions of systems etc.
In this project, three main services was created: a web application (**WordPress**), a database (**MariaDB**), and a web server (**Nginx**). Each service is a container, and they are all orchestrated using **Docker Compose**. Each image were made from **Alpine Linux** of Debian for its lightweight and building speed.
### Comparisons
#### Virtual Machines vs Docker
Virtual machines are similar to Docker containers in the sense that both isolate the application layer.
However, containers isolate only the application layer, while virtual machines replicate an entire operating system.
Therefore, containers are much lighter and faster to start than virtual machines.
#### Secrets vs Environment Variables
Environment variables and secrets both allow applications to receive configuration values at runtime, but they differ significantly in terms of security. 
**Environment variables** are easy to use but not secure.
**Secrets** are meant to be sensitive informations such as passwords, API keys etc.
#### Docker Network vs Host Network
A **Docker network** isolates containers from the rest of the system while allowing them to communicate with each other in a controlled way.
**Host Network** is the network of the host machine. A container should not use it because any port opened on the container would become open on the host.
#### Docker Volumes vs Bind Mounts
**Docker Volumes** and **Bind Mounts** are similar in the sense that both are purposed to store data. However **Docker Volumes** are managed by Docker itself, whereas **Bind Mounts** are stored where the dev wants to, on the host machine.
**Bind mounts** are mostly used for development or when access to specific host paths is required. 
**Docker Volumes** are more portable.
## Instructions
To run the Inception project, please refer to the [User Documentation](./USER_DOC.md) for end users and administrators or the [Developer Documentation](./DEV_DOC.md) for developers.
## Resources
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [VIDEO: Docker Crash Course for Absolute Beginners (1 hour)](https://youtu.be/pg19Z8LL06w?si=aQb02jJ5j2ZefEyS)
- [VIDEO: The intro to Docker I wish I had when I started (18 mins)](https://youtu.be/Ud7Npgi6x8E?si=GlTnQ6-y6UHpjbYB)
- AI was used to learn and understand the concepts of Docker and containerization in general.