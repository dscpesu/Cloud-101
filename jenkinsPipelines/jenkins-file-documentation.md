# Jenkinsfile for Docker Image Build and Push

## Overview

The Jenkinsfile in our project automates the process of building and pushing Docker images to a specified Docker registry, streamlining our development workflow.

## Prerequisites

Before using this Jenkinsfile, ensure the following prerequisites:

- A Jenkins environment set up with the necessary plugins.
- Docker Hub credentials stored in Jenkins with the ID 'dockerhub'.
- A Dockerfile for your application in the source code repository.
- A target Docker Hub repository (defined in `DOCKERHUB_REPO`).

## Steps

1. **Agent Configuration**:

   - The pipeline is configured to run on any available Jenkins agent.

2. **Environment Variables**:

   - `DOCKERHUB_CREDENTIALS`: The ID of Docker Hub credentials stored in Jenkins.
   - `DOCKERHUB_REPO`: The name of the Docker Hub repository where the Docker image will be pushed.

3. **Stages**:

   - **Checkout**:

     - This stage checks out the source code from the version control system. The `checkout scm` command is used to do this.

   - **Build and Push Docker Image**:

     - This stage contains the following steps:
       - **Authentication**: It authenticates with Docker Hub using the credentials provided in `DOCKERHUB_CREDENTIALS`.
       - **Login**: It uses the `docker login` command to log in to Docker Hub with the provided credentials.
       - **Build**: It uses the `docker build` command to build a Docker image from the Dockerfile in the current directory and tags it with the repository name specified in `DOCKERHUB_REPO` .
       - **Push**: It uses the `docker push` command to push the Docker image to the Docker Hub repository specified in `DOCKERHUB_REPO`.

   - **Post-Build Actions**:
     - **success**: If the pipeline execution is successful, it echoes a success message.
     - **failure**: If the pipeline execution fails, it echoes a failure message.

## Usage

1. Ensure that your Jenkins environment is properly set up with Docker and Pipeline plugins installed and configured.

2. Create a Dockerfile for your application and place it in your source code repository.

3. Set up Docker Hub credentials in Jenkins with the ID 'dockerhub'.
