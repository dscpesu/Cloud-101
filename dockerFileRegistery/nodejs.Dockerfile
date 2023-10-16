# Use an official Node.js base image 
FROM node:latest

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install the required Node.js dependencies
RUN npm install

# Build the React application
RUN npm run build

# Use the following command only if the application is being deployed to a development or staging environment
# RUN npm start

# Expose the port in the container, for the application to listen on it (change the port number as needed)
EXPOSE 8080

# Specify the command to run when the container starts
# Starting the Node.js web server to serve the react application
CMD ["npm", "start"]