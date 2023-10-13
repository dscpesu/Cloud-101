# Use an official base image with golang
FROM golang:latest

# Set the working directory in the container
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the current directory contents into the container at /app
COPY . ./

# Expose the port your application will listen on
EXPOSE 8080

# Build
RUN go build -o app .

# Running the golang code by creating the container
CMD ["./app"]
