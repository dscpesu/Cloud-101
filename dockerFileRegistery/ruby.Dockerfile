# Use an official Ruby image as the base image (here 2.7 is being used)
FROM ruby:2.7

# FROM ruby:latest (to use the latest Ruby image, run this command instead)

# Set the working directory in the container 
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems which are specified in the Gemfile.lock within the container
RUN bundle install

# Copy the rest of the application's files and code to the /app directory in the container
COPY . .

# Set the default command to start the Rails server when the container is run
CMD ["rails", "server"]
