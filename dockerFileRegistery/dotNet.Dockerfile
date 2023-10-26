# Use the official .NET 7.0 SDK image as the build environment
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

# Set the working directory in the container
WORKDIR /App

# Copy all files from the current directory to the container
COPY . ./

# Restore dependencies as a separate layer to take advantage of Docker layer caching
RUN dotnet restore

# Build and publish the application in Release mode, output to the 'out' directory
RUN dotnet publish -c Release -o out

# Set environment variables for the application
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ConnectionString=YourDatabaseConnectionString

# Build the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Set the working directory in the runtime container
WORKDIR /App

# Copy the published output from the build environment to the runtime container
COPY --from=build-env /App/out .

# Expose the port your application will listen on (adjust as needed)
EXPOSE 8080

# Define the entry point for the application
ENTRYPOINT ["dotnet", "YourApp.dll"]
