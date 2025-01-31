# Simple Time Service with Terraform Deployment and GitHub Actions CI/CD

This project is a simple Node.js service that returns the current timestamp in the `Asia/Kolkata` timezone and the IP address of the visitor. The service is containerized using Docker and can be deployed to AWS using Terraform. The Terraform configuration sets up a VPC, an Application Load Balancer (ALB), and an ECS cluster to run the service. Additionally, GitHub Actions workflows are included for continuous integration and deployment (CI/CD).

---

## Project Structure

```
simple-time-service/
├── app/                  # Application code
│   ├── app.js            # Main application file
│   ├── Dockerfile        # Dockerfile for containerizing the app
│   ├── package.json      # Node.js dependencies
│   └── package-lock.json # Lock file for dependencies
├── infra/                # Terraform infrastructure code
│   ├── main.tf           # Main Terraform configuration
│   ├── variables.tf      # Terraform variables
│   ├── outputs.tf        # Terraform outputs
│   └── modules/          # Terraform modules
│       ├── vpc/          # VPC module
│       ├── alb/          # ALB module
│       └── ecs/          # ECS module
├── .github/workflows/    # GitHub Actions workflows
│   ├── ecs-deploy.yml    # ECS deployment workflow
│   └── terraform.yml     # Terraform CI/CD workflow
└── README.md             # Project documentation
```

---

## Features

- **Current Timestamp**: Returns the current date and time in the `Asia/Kolkata` timezone in the format `YYYY-MM-DD HH:mm:ss`.
- **Visitor IP**: Returns the IP address of the visitor making the request.
- **Infrastructure as Code**: Terraform is used to provision the AWS infrastructure, including VPC, ALB, and ECS.
- **Containerized**: The application is containerized using Docker for easy deployment.
- **CI/CD Pipelines**: GitHub Actions workflows automate Terraform infrastructure deployment and ECS service updates.

---

## Prerequisites

- [Node.js](https://nodejs.org/) (if running locally)
- [Docker](https://www.docker.com/) (for containerization)
- [Terraform](https://www.terraform.io/) (for infrastructure provisioning)
- [AWS CLI](https://aws.amazon.com/cli/) (for AWS interactions)
- [GitHub Actions](https://github.com/features/actions) (for CI/CD)

---

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

---

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

---

### Deploying to AWS with Terraform

1. **Navigate to the Terraform directory**:
   ```bash
   cd infra
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Review the Terraform plan**:
   ```bash
   terraform plan
   ```

4. **Apply the Terraform configuration**:
   ```bash
   terraform apply
   ```

5. **Access the service**:
   After the deployment is complete, Terraform will output the DNS name of the ALB. Use this DNS name to access the service in browser.

---

## GitHub Actions Workflows

### 1. **ECS Deployment Workflow (`ecs-deploy.yml`)**

This workflow is triggered when changes are pushed to the `main` branch in the `app/` directory. It builds the Docker image, pushes it to Docker Hub, and updates the ECS service with the new image.

#### Key Steps:
- **Checkout Repository**: Pulls the latest code.
- **Configure AWS Credentials**: Uses AWS OIDC to authenticate with AWS.
- **Log in to Docker Hub**: Authenticates with Docker Hub using secrets.
- **Build, Tag, and Push Docker Image**: Builds the Docker image, tags it with the Git commit SHA, and pushes it to Docker Hub.
- **Update ECS Task Definition**: Updates the ECS task definition with the new Docker image.
- **Deploy to ECS**: Deploys the updated task definition to the ECS service.

---

### 2. **Terraform CI/CD Workflow (`terraform.yml`)**

This workflow is triggered when changes are pushed to the `main` branch or a pull request is opened targeting the `main` branch in the `infra/` directory. It validates, plans, and applies Terraform configurations.

#### Key Steps:
- **Checkout Repository**: Pulls the latest code.
- **Configure AWS Credentials**: Uses AWS OIDC to authenticate with AWS.
- **Setup Terraform**: Installs the latest version of Terraform.
- **Initialize Terraform**: Initializes the Terraform working directory.
- **Terraform Plan**: Generates an execution plan for Terraform.
- **Upload Plan Artifact**: Uploads the Terraform plan as an artifact for review (only for pull requests).
- **Terraform Apply**: Applies the Terraform configuration (only for `main` branch pushes).

## Terraform Configuration

The Terraform configuration is divided into modules for better organization and reusability:

### Modules

1. **VPC Module**:
   - Creates a VPC with public and private subnets across multiple availability zones.
   - Configures route tables and internet gateway and NAT gateway.

2. **ALB Module**:
   - Creates an Application Load Balancer (ALB) to route traffic to the ECS service.
   - Configures security groups and target groups.

3. **ECS Module**:
   - Creates an ECS cluster and service to run the Docker container.
   - Configures task definitions, security groups, and IAM roles.

### Outputs

- **ALB DNS Name**: The DNS name of the Application Load Balancer.
- **Task Definition ARN**: The ARN of the ECS task definition.

```hcl
output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the load balancer"
}

output "task_definition_arn" {
  value = module.ecs.task_definition_arn
}
```

---

## API Endpoint

- **GET `/`**:
  - **Response**:
    ```json
    {
      "timestamp": "2025-01-30 14:30:45",
      "ip": "10.0.2.24"
    }
    ```
