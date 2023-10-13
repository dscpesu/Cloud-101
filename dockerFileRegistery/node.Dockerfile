# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose a port that the application will listen on (replace 3000 with your app's port)
EXPOSE 3000

# Define the command to start your Node.js application (replace "app.js" with your entry file)
CMD ["node", "app.js"]
