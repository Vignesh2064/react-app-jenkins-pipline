# Stage 1: Build the React Application
FROM node:18 as build
WORKDIR /app

# Copy both package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application and build it
COPY . .
RUN npm run build

# Stage 2: Setup the Nginx Server to serve the React Application
FROM nginx:1.25.0-alpine as production

# Copy built React files to Nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
