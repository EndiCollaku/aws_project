# Use official Node.js image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Set environment variables (if needed, could also be set in docker-compose)
ENV DATABASE_HOST=final-project-db-instance.cp4uqqyiq3l6.eu-west-1.rds.amazonaws.com
ENV DATABASE_PORT=5432
ENV DATABASE_USER=postgres
ENV DATABASE_PASSWORD=postgres
ENV DATABASE_NAME=mydatabase

# Expose the port the app will run on
EXPOSE 5000

# Start the API application
CMD ["npm", "start"]
