# Use an official Node.js runtime as the base image
FROM node:18-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json file into the container
COPY package* .

# Install the dependencies
RUN npm install

# Copy all of the appliaction files into the container
COPY . .

# Build the React app 
RUN npm run build

# Second stage where we will be serving the application
FROM node:18-alpine

# Copy the build files from the build stage to the current stage
COPY --from=build /app/build /app/build

# Installing serve package offered by npm to serve the application on a port
RUN npm install -g serve

# Expose a port if your application serves content (change port number as required)
# EXPOSE 3000

# Start the application
CMD ["serve", "-s", "/app/build"]
