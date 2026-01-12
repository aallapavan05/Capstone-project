                    Capstone Project: CI/CD System Using Docker and GitHub Actions
Project Overview

The objective of this capstone project is to design and implement a complete CI/CD (Continuous Integration and Continuous Deployment) system for a web application. The system automatically tests, builds, scans, and deploys the application using Docker and GitHub Actions.
The application is deployed through a staging environment, ensuring that changes are validated before reaching production.

This project demonstrates real-world DevOps practices such as containerization, automation, security scanning, and environment-based deployment.

Application Architecture

The application follows a 2-tier architecture:

Frontend Tier:
A static frontend served using Express.js, responsible for handling client-side requests and displaying UI content.
The frontend is responsible for:

Handling user interactions

Displaying UI content

Sending requests to the backend API

Frontend Technology

Built using Express.js

Serves static files (HTML, CSS, JavaScript)

Runs inside a Docker container

Frontend Flow

User accesses the application through a browser

Browser sends a request to the frontend container

Frontend serves static UI content

For dynamic data, frontend sends API requests to the backend

Key Characteristics

No direct access to the database

Communicates only with the backend

Containerized for consistency and portability


<img width="727" height="701" alt="extensions-architecture" src="https://github.com/user-attachments/assets/e973ddbe-a7fe-4bee-a950-bfe78ec71059" />

<img width="1341" height="857" alt="Screenshot 2026-01-12 112513" src="https://github.com/user-attachments/assets/9fac5127-4471-411d-94c4-445e2e09f9c5" />
<img width="1602" height="870" alt="Screenshot 2026-01-12 112726" src="https://github.com/user-attachments/assets/ad8fdd60-227f-4d5d-9c89-33ff8c6eeb69" />








Backend Tier:
An Express.js backend API that handles business logic, processes requests from the frontend, and communicates with the database.
Role of Backend

The backend is responsible for:

Handling business logic

Processing API requests from frontend

Managing database operations

Running database migrations

Backend Technology

Built using Express.js (Node.js)

Exposes REST APIs

Runs inside a Docker container

Backend Flow

Backend receives HTTP requests from frontend

Business logic is executed

Backend connects to the database

Data is fetched or updated

Response is sent back to frontend

Key Characteristics

Uses environment variables for configuration

Runs unit tests inside Docker

Acts as the only layer that talks to the database


<img width="741" height="362" alt="Express-REST-API-Struc aa7ecaa0c41dbb7344c70665a5f5e259" src="https://github.com/user-attachments/assets/cd55a062-4f5c-4ead-888d-d1ae6411fa62" />


<img width="1662" height="804" alt="Screenshot 2026-01-12 120108" src="https://github.com/user-attachments/assets/85be7a4e-f116-4a7f-8ecf-a80594c2beb5" />

<img width="1011" height="700" alt="Screenshot 2026-01-12 112529" src="https://github.com/user-attachments/assets/392f41a9-1172-465f-a81f-799c39b272bc" />






Database:
PostgreSQL is used to store application data persistently.

Each component runs inside its own Docker container, allowing isolation, scalability, and portability.

Dockerization of the Application

Both the frontend and backend applications are containerized using Docker.

Docker Best Practices Implemented

Multi-stage builds are used to reduce the final Docker image size by separating build dependencies from runtime dependencies.

Non-root users are configured inside containers to improve security.

Layer caching is applied to speed up rebuilds by reusing unchanged layers.

Environment variables are used for configuration, avoiding hardcoded values.

These practices ensure optimized, secure, and production-ready Docker images.

Local Development with Docker Compose

A docker-compose.yml file is created to simplify local development and testing.





Docker Compose defines:

Backend service

Frontend service

PostgreSQL database service

It also configures:

Volumes for database persistence

Networking to allow services to communicate internally

Environment variables loaded from .env files

With Docker Compose, the entire application stack can be started using a single command, making development and testing easier.

Environment-Specific Configuration (Staging)

To support different environments, separate configuration files are used:

.env for local development

.env.staging for staging environment

These files store database credentials and application settings.
This approach allows the same application code to run in different environments without modification.
<img width="1196" height="764" alt="Screenshot 2026-01-12 120405" src="https://github.com/user-attachments/assets/b68779f7-ee8d-4c38-9540-a2bd01a67a9c" />
<img width="1275" height="923" alt="Screenshot 2026-01-12 120322" src="https://github.com/user-attachments/assets/e74bef9d-3a83-4cb8-a4d8-9b9dccd41eef" />








CI/CD Pipeline Using GitHub Actions

A GitHub Actions pipeline is configured to automate the CI/CD process.
The pipeline is triggered automatically whenever code is pushed to the main or staging branch.



![https___dev-to-uploads s3 amazonaws com_uploads_articles_gnnd2c1i7ksf3ou2fu7q](https://github.com/user-attachments/assets/f528d29e-9639-47f3-ac98-40692032508f)
![What-is-the-CICD-Pipeline](https://github.com/user-attachments/assets/8301c4b9-bff3-4bfe-b622-49f56b5c70e2)


CI/CD Pipeline Stages Explained
1. Code Checkout

The pipeline starts by fetching the latest source code from the GitHub repository.

2. Unit Test Execution

Unit tests are executed inside Docker containers, ensuring that tests run in the same environment as production.
This step verifies application correctness before proceeding further.

If tests fail, the pipeline stops immediately.

3. Docker Image Build

After successful tests:

Backend Docker image is built

Frontend Docker image is built

Multi-stage Dockerfiles ensure optimized image size and faster builds.

4. Tagging and Pushing Images

The built images are tagged and pushed to Docker Hub, making them available for deployment.

This step ensures versioned and reusable container images.

5. Security Scanning

Docker images are scanned using Trivy to detect vulnerabilities.
The scan focuses on high and critical severity issues.

Security scanning helps identify risks early in the development lifecycle.

<img width="1880" height="1011" alt="Screenshot 2026-01-11 102210" src="https://github.com/user-attachments/assets/aece2efa-653b-4381-83f3-79941c499ad2" />




Deployment to Staging Environment

Deployment is performed using Docker Compose for staging.

The deployment process includes:

Pulling the latest images from Docker Hub

Stopping any existing containers

Starting new containers using updated images

Running database migration scripts

Verifying application startup

This ensures the staging environment always runs the latest stable version.

Database Migration

Database migrations are executed after deployment to ensure schema consistency.
This step prepares the database for new application changes without data loss.

Deployment Verification

Deployment success is verified by:

Checking backend logs for successful startup

Ensuring database tables are created

Accessing frontend and backend services through the browser or API endpoints

Key Deliverables Achieved

Working 2-tier web application with database

Optimized Docker images using multi-stage builds

Fully functional CI/CD pipeline using GitHub Actions

Unit test execution inside Docker

Security scanning with Trivy

Staging deployment using Docker Compose




Conclusion

This capstone project successfully demonstrates the implementation of an end-to-end CI/CD pipeline using Express.js, Docker, and GitHub Actions.
It reflects industry-standard DevOps practices, including automation, containerization, security, and environment-based deployment, making it suitable for real-world production scenarios.
This capstone project successfully demonstrates the design and implementation of a complete CI/CD system for a containerized web application using Docker and GitHub Actions. The project follows a 2-tier architecture with an Express-based frontend and backend, integrated with a PostgreSQL database, and reflects real-world DevOps practices.

The application was fully Dockerized using best practices such as multi-stage builds, non-root containers, environment-based configuration, and Docker Compose for local and staging environments. These practices resulted in optimized, secure, and portable container images.

A GitHub Actions CI/CD pipeline was implemented to automate key stages of the software delivery lifecycle. The pipeline executes unit tests inside Docker containers, builds frontend and backend images, pushes them to a container registry, and performs security scanning using Trivy. This ensures that only tested and secure images are promoted further in the pipeline.

Deployment to the staging environment was achieved using Docker Compose, where the latest images are pulled, containers are restarted, database migrations are executed, and deployment success is verified. This approach ensures consistency between development, CI, and staging environments.

Overall, the project achieves its objectives by delivering a reliable, automated, and scalable CI/CD workflow. It highlights practical DevOps skills including containerization, automation, security awareness, and environment management, making the solution suitable for real-world application deployment and an effective demonstration of modern CI/CD practices.
