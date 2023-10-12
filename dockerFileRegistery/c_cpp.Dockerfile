# Use an official base image with a C/C++ dev environment
FROM gcc:latest

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Define an environment variable if needed
# ENV MY_ENV_VARIABLE=my_value

# Expose a port if your C/C++ application listens on it (change the port number as needed)
# EXPOSE 8080


# Compile either the C/C++ code accordingly (this command also installs the required dependencies)

# To compile the C code
# RUN g++ -o app main.c

# To compile the C++ code
# RUN g++ -o app main.cpp

# Specify the default command to run when the container starts
CMD ["./app"]