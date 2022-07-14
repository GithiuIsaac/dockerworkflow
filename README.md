# Creating a Docker Workflow
This project creates a simple Python app, sets up a virtual environment & installs the required dependencies.

It then tests & lints the code for both the app and the container.

It has the functionality to validate the circleci config file, and run a local circleci build to simulate the actual CircleCI cloud environment.

CircleCI automates the setup and linting processes, and will be updated to automate the testing.

To deploy to ECR `407368554722.dkr.ecr.us-east-1.amazonaws.com/docker-workflow`:
Retrieve an authentication token and authenticate your Docker client to the registry.

`aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 407368554722.dkr.ecr.us-east-1.amazonaws.com`

Build the Docker image:

`docker build -t docker-workflow:v1 .`

Tag the image to push it to this repository:

`docker tag docker-workflow:v1 407368554722.dkr.ecr.us-east-1.amazonaws.com/docker-workflow:v1`

Push the image to the AWS repository:

`docker push 407368554722.dkr.ecr.us-east-1.amazonaws.com/docker-workflow:v1`