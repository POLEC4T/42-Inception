<!-- A README.md file must be provided at the root of your Git repository. Its purpose is
to allow anyone unfamiliar with the project (peers, staff, recruiters, etc.) to quickly
understand what the project is about, how to run it, and where to find more information
on the topic.
The README.md must include at least:
• The very first line must be italicized and read: This project has been created as part
of the 42 curriculum by <login1>[, <login2>[, <login3>[...]]].
• A “Description” section that clearly presents the project, including its goal and a
brief overview.
• An “Instructions” section containing any relevant information about compilation,
installation, and/or execution.
• A “Resources” section listing classic references related to the topic (documen-
tation, articles, tutorials, etc.), as well as a description of how AI was used —
specifying for which tasks and which parts of the project.
➠ Additional sections may be required depending on the project (e.g., usage
examples, feature list, technical choices, etc.).
Any required additions will be explicitly listed below.
• A Project description section must also explain the use of Docker and the sources
included in the project. It must indicate the main design choices, as well as a
comparison between:
◦ Virtual Machines vs Docker
◦ Secrets vs Environment Variables
◦ Docker Network vs Host Network
◦ Docker Volumes vs Bind Mounts -->

# Inception
*This project has been created as part of the 42 curriculum by mniemaz.*
## Description
Inception is a project that involves setting up a web application environment using Docker and Docker Compose. The goal is to discover the world of containerization, learn how to manage multi-container applications, and understand the benefits of using Docker for development and deployment. Three main services are provided: a web application (WordPress), a database (MariaDB), and an administration panel for managing the application. They are orchestrated using Docker Compose.
## Instructions
To run the Inception project, please refer to the [User Documentation](./USER_DOC.md) for end users and administrators or the [Developer Documentation](./DEV_DOC.md) for developers.
## Resources
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
AI was used to learn and understand the concepts of Docker and containerization in general.