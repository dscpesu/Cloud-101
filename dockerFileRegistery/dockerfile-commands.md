# Dockerfile Commands Overview

## FROM

**Purpose:** Specifies the source image for a Docker container, which can be either an official repository (pulled from docker hub), or your own custom one.

**Usage:** `FROM <image_name>:<tag>`

**Options:**

- `<tag>`: Specifies the tag of the base image to use. If no tag is specified, the latest tag will be used.

## WORKDIR

**Purpose:** Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it.

**Usage:** `WORKDIR /path/to/directory`

## COPY

**Purpose:** Copies files or directories from the build context into the image specified.

**Usage:** `COPY <source> <destination>`

## RUN

**Purpose:** Executes commands in a new layer on top of the current image.

**Usage:** `RUN <command>`

## EXPOSE

**Purpose:** Informs Docker that the container listens on specified network ports at runtime.

**Usage:** `EXPOSE <port> [<port>/<protocol>...]`

## CMD

**Purpose:** Provides defaults for executing a container. An executable can be included, or omitted, in case of which the ENTRYPOINT instruction must be specified.

**Usage:** `CMD ["executable","param1","param2"]`

## ENTRYPOINT

**Purpose:** Configures a container that will run as an executable.

**Usage:** `ENTRYPOINT ["executable", "param1", "param2"]`

## ENV

**Purpose:** Sets the environment variable `<key>` to the value `<value>`.

**Usage:** `ENV <key> <value>`

## ARG

**Purpose:** Defines a variable that users can pass at build-time to the builder with the docker build command.

**Usage:** `ARG <name>[=<default value>]`

## VOLUME

**Purpose:** Creates a mount point with the specified name and marks it as holding externally mounted volumes from the native host or other containers.

**Usage:** `VOLUME /path/to/volume`

## Additional Information

The above mentioned commands are the most commonly used Dockerfile commands. Do refer to the official Docker documentation for a more comprehensive list with detailed explanation.

[Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
