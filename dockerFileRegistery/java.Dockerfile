# Use an official base image with Java Runtime Environment
FROM openjdk:latest

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the port your application will listen on
EXPOSE 8080

# Define any environment variables if needed
ENV APP_ENV=production

# To compile the Java code
RUN javac Main.javac

# Running the java code by creating the container
CMD ["java", "Main"]
