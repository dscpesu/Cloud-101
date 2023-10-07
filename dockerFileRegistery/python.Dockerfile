# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Define environment variable (if needed)
# ENV MY_ENV_VARIABLE=my_value

# Expose a port if your Python application listens on a specific port
# EXPOSE 8080

# Run your Python application
CMD [ "python", "app.py" ]
