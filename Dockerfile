# Step 1: Use an official Node.js image as the base image
FROM node:19-alpine

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json /app/

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application source code
COPY . /app/

# Step 6: Build the application
RUN npm run build

# Step 7: Expose the port
EXPOSE 5173

# Step 8: Run the application in production mode
CMD ["npm", "run", "dev"]
