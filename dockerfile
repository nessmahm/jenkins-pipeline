# Use an official Node.js image as a base
FROM node:18-alpine
# Set the working directory inside the container
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY package.json .
# Install dependencies
RUN npm install
COPY . .
RUN npm run build

# Copy the rest of the application code

# Expose port 80 to the outside world
EXPOSE 9090

# Run the web server
CMD [ "npm", "run", "dev" ]
