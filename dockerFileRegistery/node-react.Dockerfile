# Use an official Node.js LTS image as a base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Install build tools (if needed)
RUN npm install -g create-react-app

# Install application dependencies
RUN npm install

# Build your React application (adjust the command as needed)
RUN npm run build

# Remove build tools and development dependencies to reduce the image size
RUN npm uninstall -g create-react-app && npm prune --production

# Expose the port if your application listens on a specific port
# EXPOSE 3000

# Define environment variables if necessary
# ENV NODE_ENV=production

# Start the Node.js server (adjust the command as needed)
CMD ["node", "server.js"]
