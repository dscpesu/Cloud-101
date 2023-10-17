#Stage 1: Building the application

# Use an official Node.js runtime as the base image
FROM node:14-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json file into the container
COPY package*.json ./

# Copy all of the appliaction files into the container
COPY . .

# Install the dependencies and Build the Next.js app 
RUN npm install && npm run build


# Stage 2: Create a smaller image for runtime
FROM node:14-slim AS runtime

# Set the working directory in the runtime stage
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json ./package.json

# Expose a port if your application serves content (change port number as required)
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
