# Use a base Node.js image
FROM node:18.20.5

# Set the working directory
WORKDIR /usr/src/app

# Install Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://gitlab.com/nl2hc/nclsa.git amd-cpu-data

# Change directory to the cloned repo
WORKDIR /usr/src/app/amd-cpu-data

# Expose any ports if required (not necessary for Heroku, but can be useful for local testing)
EXPOSE 8080

# Run the application
CMD ["node", "app.js"]
