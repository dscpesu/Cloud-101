# Jenkinsfile for Docker Image Build and Push

## Overview

The Jenkinsfile in our project automates the process of building and pushing Docker images to a specified Docker registry, streamlining our development workflow.

## Prerequisites

Before using this Jenkinsfile, ensure the following prerequisites:

- A Jenkins environment set up with the necessary plugins.
- Docker Hub credentials stored in Jenkins with the ID 'dockerhub'.
- A Dockerfile for your application in the source code repository.
- A target Docker Hub repository (defined in `DOCKERHUB_REPO`).
