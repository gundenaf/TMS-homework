# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire frontend directory to the working directory
COPY . .

# Expose port 3000 (default for React applications)
EXPOSE 3000

# Run the npm start command to start the React application
CMD ["npm", "start"]
