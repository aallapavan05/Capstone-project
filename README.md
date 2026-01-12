Capstone Project: CI/CD System Using Docker and GitHub Actions
Project Overview

The objective of this capstone project is to design and implement a complete CI/CD (Continuous Integration and Continuous Deployment) system for a web application. The system automatically tests, builds, scans, and deploys the application using Docker and GitHub Actions.
The application is deployed through a staging environment, ensuring that changes are validated before reaching production.

This project demonstrates real-world DevOps practices such as containerization, automation, security scanning, and environment-based deployment.

                            live demo video for overall project
 

https://github.com/user-attachments/assets/2513c6df-5ce4-4ca6-afc8-b626d32e8c81




Application Architecture

The application follows a 2-tier architecture:

Frontend Tier:
A static frontend served using Express.js, responsible for handling client-side requests and displaying UI content.
The frontend is responsible for:

-->Handling user interactions

-->Displaying UI content

-->Sending requests to the backend API

-->Frontend Technology

-->Built using Express.js

-->Serves static files (HTML, CSS, JavaScript)

-->Runs inside a Docker container

Frontend Flow:

-->User accesses the application through a browser

-->Browser sends a request to the frontend container

-->Frontend serves static UI content

-->For dynamic data, frontend sends API requests to the backend

Key Characteristics:

-->No direct access to the database

-->Communicates only with the backend

-->Containerized for consistency and portability


<img width="727" height="701" alt="extensions-architecture" src="https://github.com/user-attachments/assets/e973ddbe-a7fe-4bee-a950-bfe78ec71059" />

<img width="1341" height="857" alt="Screenshot 2026-01-12 112513" src="https://github.com/user-attachments/assets/9fac5127-4471-411d-94c4-445e2e09f9c5" />
<img width="1602" height="870" alt="Screenshot 2026-01-12 112726" src="https://github.com/user-attachments/assets/ad8fdd60-227f-4d5d-9c89-33ff8c6eeb69" />








Backend Tier:
An Express.js backend API that handles business logic, processes requests from the frontend, and communicates with the database.
Role of Backend

The backend is responsible for:

-->Handling business logic

-->Processing API requests from frontend

-->Managing database operations

-->Running database migrations

Backend Technology:

-->Built using Express.js (Node.js)

-->Exposes REST APIs

-->Runs inside a Docker container

-->Backend Flow

-->Backend receives HTTP requests from frontend

-->Business logic is executed

-->Backend connects to the database

-->Data is fetched or updated

-->Response is sent back to frontend

Key Characteristics

-->Uses environment variables for configuration

-->Runs unit tests inside Docker

-->Acts as the only layer that talks to the database


<img width="741" height="362" alt="Express-REST-API-Struc aa7ecaa0c41dbb7344c70665a5f5e259" src="https://github.com/user-attachments/assets/cd55a062-4f5c-4ead-888d-d1ae6411fa62" />


<img width="1662" height="804" alt="Screenshot 2026-01-12 120108" src="https://github.com/user-attachments/assets/85be7a4e-f116-4a7f-8ecf-a80594c2beb5" />

<img width="1011" height="700" alt="Screenshot 2026-01-12 112529" src="https://github.com/user-attachments/assets/392f41a9-1172-465f-a81f-799c39b272bc" />






Database:
PostgreSQL is used as the relational database management system for this project to store application data persistently and reliably. It is responsible for managing structured data, maintaining data integrity, and supporting transactional operations required by the application. The PostgreSQL database runs inside its own Docker container, which ensures isolation from the application logic while still allowing secure and efficient communication with the backend service through an internal Docker network. Using PostgreSQL in a containerized environment ensures consistency across development, staging, and deployment environments and simplifies database setup and maintenance.

Each component of the application—frontend, backend, and database—runs inside a separate Docker container. This container-based architecture provides strong isolation between services, ensuring that issues in one component do not directly impact others. It also improves scalability and flexibility, as individual services can be updated, restarted, or scaled independently. Docker containers make the application portable and platform-independent, allowing it to run consistently on any system that supports Docker.

Dockerization of the Application

Both the frontend and backend applications are fully containerized using Docker. Dockerization packages the application code, dependencies, and runtime environment into lightweight and reusable images. This eliminates environment-related issues and ensures that the application behaves consistently across development, CI/CD pipelines, and staging environments.

Several Docker best practices are followed to ensure optimized, secure, and production-ready images. Multi-stage Docker builds are used to separate build-time dependencies from runtime dependencies. This significantly reduces the size of the final Docker images by excluding unnecessary build tools and files, resulting in faster image downloads and improved performance. Additionally, containers are configured to run as non-root users, which enhances security by minimizing the impact of potential vulnerabilities.

Docker layer caching is applied to optimize build performance. By structuring Dockerfiles efficiently, unchanged layers are reused during subsequent builds, reducing build time and speeding up the CI/CD process. Environment variables are used for application configuration, such as database credentials and service endpoints, instead of hardcoding values in the source code. This improves security, flexibility, and ease of configuration across different environments.

Local Development Using Docker Compose

For local development and testing, Docker Compose is used to manage and orchestrate the entire application stack. A docker-compose.yml file defines all required services, including the frontend service, backend service, and PostgreSQL database service. Docker Compose allows developers to start and stop the complete application using a single command, greatly simplifying the development workflow.

Docker Compose also configures persistent volumes for the PostgreSQL database, ensuring that data is retained even when containers are restarted or removed. An internal Docker network is automatically created, enabling secure communication between the frontend, backend, and database containers using service names instead of hardcoded IP addresses. Environment variables are loaded from .env files, allowing centralized and consistent configuration across all services.

Using Docker Compose ensures that the local development environment closely mirrors the staging environment, reducing configuration mismatches and improving testing reliability.

Environment-Specific Configuration (Staging)

To support multiple deployment environments, the project uses separate environment configuration files. The .env file is used for local development, while .env.staging is used for the staging environment. These files store environment-specific values such as database credentials, hostnames, and application settings.

This approach allows the same application code and Docker images to be reused across different environments without modification. By changing only the environment configuration files, the application can be deployed safely and consistently in staging. Environment-specific configuration improves deployment flexibility, reduces the risk of misconfiguration, and aligns with best practices in modern CI/CD workflows.



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

Deployment to the staging environment is carried out using Docker Compose, which allows multiple services to be managed and deployed together in a controlled and consistent manner. The staging deployment process begins by pulling the latest Docker images for the frontend and backend services from Docker Hub. These images are the same ones that were previously built, tested, and scanned in the CI/CD pipeline, ensuring that only verified and stable artifacts are deployed.

Before deploying the updated version, any existing running containers in the staging environment are stopped gracefully. This prevents conflicts such as port binding issues and ensures that outdated services are fully replaced. Once the old containers are stopped, new containers are started using the updated images defined in the docker-compose.staging.yml file. This file contains staging-specific configuration such as environment variables and service settings, ensuring that the application behaves correctly in the staging environment.

By following this process, the staging environment is always kept in sync with the latest stable version of the application, providing a reliable platform for validation and testing before any further promotion.

Database Migration

After the application containers are successfully started in the staging environment, database migrations are executed to maintain schema consistency. Migration scripts are responsible for applying any required changes to the database structure, such as creating new tables, modifying existing columns, or updating constraints.

Running migrations after deployment ensures that the database schema matches the version of the application that is currently running. This step is critical because it allows the application to introduce new features or changes without breaking existing data. The migration process is designed to be safe and incremental, ensuring that no existing data is lost during updates.

Deployment Verification

Once deployment and database migration are completed, the deployment is verified to ensure that the application is functioning correctly. Verification begins by checking the backend container logs to confirm that the application has started successfully and is listening for incoming requests. These logs provide immediate feedback on the health and readiness of the backend service.

Next, the database is verified by ensuring that the required tables and schema changes have been created successfully as part of the migration process. This confirms that the database is properly initialized and synchronized with the application.

Finally, the frontend and backend services are accessed through the browser or API endpoints to confirm end-to-end functionality. Successful responses from the application and correct rendering of the frontend interface indicate that the deployment has completed successfully and the staging environment is ready for further testing or validation.

<img width="1872" height="603" alt="Screenshot 2026-01-12 121728" src="https://github.com/user-attachments/assets/0c5f4301-5487-46d7-8aa1-58f081beb73a" />
<img width="1860" height="987" alt="Screenshot 2026-01-12 121641" src="https://github.com/user-attachments/assets/abd9f944-2800-401f-9d76-9f4a0f9ff218" />
<img width="1873" height="987" alt="Screenshot 2026-01-12 121701" src="https://github.com/user-attachments/assets/b5b1dc92-3141-4f06-a9d2-06329436ab27" />






Conclusion

This capstone project successfully demonstrates the implementation of an end-to-end CI/CD pipeline using Express.js, Docker, and GitHub Actions.
It reflects industry-standard DevOps practices, including automation, containerization, security, and environment-based deployment, making it suitable for real-world production scenarios.
This capstone project successfully demonstrates the design and implementation of a complete CI/CD system for a containerized web application using Docker and GitHub Actions. The project follows a 2-tier architecture with an Express-based frontend and backend, integrated with a PostgreSQL database, and reflects real-world DevOps practices.

The application was fully Dockerized using best practices such as multi-stage builds, non-root containers, environment-based configuration, and Docker Compose for local and staging environments. These practices resulted in optimized, secure, and portable container images.

A GitHub Actions CI/CD pipeline was implemented to automate key stages of the software delivery lifecycle. The pipeline executes unit tests inside Docker containers, builds frontend and backend images, pushes them to a container registry, and performs security scanning using Trivy. This ensures that only tested and secure images are promoted further in the pipeline.

Deployment to the staging environment was achieved using Docker Compose, where the latest images are pulled, containers are restarted, database migrations are executed, and deployment success is verified. This approach ensures consistency between development, CI, and staging environments.

Overall, the project achieves its objectives by delivering a reliable, automated, and scalable CI/CD workflow. It highlights practical DevOps skills including containerization, automation, security awareness, and environment management, making the solution suitable for real-world application deployment and an effective demonstration of modern CI/CD practices.
