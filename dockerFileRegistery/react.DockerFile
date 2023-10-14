# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json file into the container
COPY package.json .

# Install the dependencies
RUN npm install

# Copy all of the appliaction files into the container
COPY . .

# Build the React app 
RUN npm run build

# Expose a port if your application serves content (change port number as required)
# EXPOSE 3000

# Start the application
CMD ["npm", "start"]
