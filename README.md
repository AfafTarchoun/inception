# Inception - System Administration with Docker
:whale:

## Introduction

This project aims to enhance your system administration skills by using Docker to virtualize several Docker images within a virtual machine. You will set up a small infrastructure composed of different services following specific rules, all managed using Docker Compose.

## General Guidelines

- The project should be executed on a Virtual Machine.
- Place all configuration files for your project in the `srcs` folder.
- Provide a `Makefile` at the root of your directory to set up the entire application, including building Docker images using `docker-compose.yml`.
- Feel free to explore and research Docker usage and concepts to complete the assignment successfully.

## Mandatory Part

### Project Structure

- Each Docker image must have the same name as its corresponding service.
- Each service should run in a dedicated container.
- Optimize performance by building containers from the penultimate stable version of Alpine or Debian.

### Docker Images and Dockerfiles

- Create your own Dockerfiles for each service and call them in `docker-compose.yml` using the `Makefile`.
- Avoid using pre-built Docker images or external services like DockerHub (Alpine/Debian excluded).

### Services to Set Up

1. **NGINX Container**: Setup a Docker container containing NGINX with TLSv1.2 or TLSv1.3 only.
2. **WordPress Container**: Create a Docker container containing WordPress + php-fpm without nginx.
3. **MariaDB Container**: Build a Docker container containing MariaDB only without nginx.
4. **WordPress Database Volume**: Utilize a volume to store your WordPress database.
5. **WordPress Website Volume**: Use a separate volume to store your WordPress website files.
6. **Docker Network**: Establish a docker-network to connect your containers.

### Container Restart and Entry Points

- Ensure your containers automatically restart in case of a crash.
- Avoid using hacks like 'tail -f' for container execution. Follow best practices for writing Dockerfiles.

### WordPress Database

- Configure your WordPress database to have two users, one of them being the administrator. The administrator's username must not contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, etc.).

### Volumes and Domain Configuration

- Your volumes will be accessible on the host machine at `/home/login/data`, where `login` should be replaced with your actual login.
- Setup a domain name to point to your local IP address. Use the domain name `login.42.fr`, replacing `login` with your own login.

### Security and Credentials

- Avoid using the `latest` tag for Docker images.
- Never include passwords or sensitive data in your Dockerfiles.
- Make use of environment variables, and consider using a `.env` file at the root of the `srcs` directory to store them securely.
- For security, do not publicly store any credentials, API keys, or environment variables. Always ignore them in version control using `.gitignore`.
