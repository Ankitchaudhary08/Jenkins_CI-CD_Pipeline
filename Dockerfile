# Use Nginx image to serve static website
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy our website files to nginx html folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# No need for CMD because nginx image already has default command
