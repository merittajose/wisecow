# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    cowsay \
    fortune \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Set the PATH environment variable
ENV PATH="/usr/games:${PATH}"

# Copy the script into the container
COPY wisecow.sh .

# Give execution permissions to the script
RUN chmod +x wisecow.sh

# Run the script when the container starts
ENTRYPOINT ["./wisecow.sh"]