# Stage 1: Building the application
FROM node:18-alpine AS deps

# Install the necessary library for Alpine Linux
RUN apk add --no-cache libc6-compat

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install production dependencies using npm
RUN npm install --production

# Stage 2: Building the project
FROM node:18-alpine AS builder

# Set the working directory to /app
WORKDIR /app

# Copy the installed node modules from the "deps" stage
COPY --from=deps /app/node_modules ./node_modules

# Copy the project files and code
COPY . .

# Set an environment variable to disable Next.js telemetry
ENV NEXT_TELEMETRY_DISABLED 1

# Build the project using npm
RUN npm run build

# Stage 3: Prepare for running the application
FROM node:18-alpine AS runner

# Set the working directory to /app
WORKDIR /app

# Set environment variables for Node.js and disable Next.js telemetry
ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

# Create a system group and user with specific UIDs and GIDs
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy the built .next directory from the "builder" stage
COPY --from=builder --chown=nextjs:nodejs /app/.next ./.next

# Copy the installed node modules and package.json from the "builder" stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Set the user to "nextjs"
USER nextjs

# Expose port 3000
EXPOSE 3000

# Set the environment variable for the port
ENV PORT 3000

# Start the application
CMD ["npm", "start"]