 # Simple Time Service

This is a simple Node.js service that returns the current timestamp in the `Asia/Kolkata` timezone and the IP address of the visitor. The service is containerized using Docker for easy deployment.

## Features

- **Current Timestamp**: Returns the current date and time in the `Asia/Kolkata` timezone in the format `YYYY-MM-DD HH:mm:ss`.
- **Visitor IP**: Returns the IP address of the visitor making the request.

## Prerequisites

- [Node.js](https://nodejs.org/) (if running locally)
- [Docker](https://www.docker.com/) (if running in a container)

## Getting Started

### Running Locally

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repo/simple-time-service.git
   cd simple-time-service
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the server**:
   ```bash
   npm start
   ```

4. **Access the service**:
   Open your browser or use a tool like `curl` to access the service at `http://localhost:3000`.

### Running with Docker

1. **Build the Docker image**:
   ```bash
   docker build -t simple-time-service .
   ```

2. **Run the Docker container**:
   ```bash
   docker run -p 3000:3000 simple-time-service
   ```

3. **Access the service**:
   Open your browser or use a tool like `curl` to access the service at `http://localhost:3000`.

## API Endpoint

- **GET `/`**:
  - **Response**:
    ```json
    {
      "timestamp": "2025-01-30 14:30:45",
      "ip": "10.0.1.23"
    }
    ```

## Dockerfile

The Dockerfile is configured to use the `node:20-alpine` image for a lightweight container. It sets up the working directory, installs dependencies, copies the application code, exposes port 3000, and starts the service.

```Dockerfile
FROM node:20-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```
