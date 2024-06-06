# Use an official Go runtime as a base image
FROM golang:latest AS build-dev

# Set the working directory inside the container
WORKDIR /app

# Copy the local package files to the container's workspace
COPY . .

# Install Go (if not already installed in the base image)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*
    
RUN go mod init myapp
    
# Build the Go application
RUN go build -o myapp .

# Run the Go application
CMD ["./myapp"]