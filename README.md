# Node.js Hello World App

This is a simple "Hello World" Node.js application that runs inside a Docker container. It sets up an HTTP server that responds with "Hello World" when accessed.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running Locally](#running-locally)
- [Building and Running with Docker](#building-and-running-with-docker)
- [Jenkins Pipeline Example](#jenkins-pipeline-example)

## Prerequisites

Make sure you have the following installed on your system:

- [Node.js](https://nodejs.org/) (if running locally)
- [Docker](https://www.docker.com/get-started)

## Installation

1. Clone the repository to your local machine:

   ```bash
      git clone https://github.com/your-username/your-nodejs-repo.git
      cd your-nodejs-repo
2. Install the necessary dependencies:
   ```bash
   npm start
  This will start a web server on http://localhost:3000 that returns "Hello World".

## Running Locally
To run the application on your local machine without Docker, use the following command:
   ```bash
   npm start
   ```

This will start a web server on http://localhost:3000 that returns "Hello World".

## Building and Running with Docker

If you prefer to run the application inside a Docker container, follow these steps:
  1. Build the Docker image:
  2. Run the Docker container:
   ```bash
   docker run -d -p 3000:3000 --name running-node-app node-app
   ```
  3. Open your browser or use curl to visit http://localhost:3000 and you should see "Hello World".
  4. To stop and remove the running container:
     ```bash
     docker stop running-node-app
     docker rm running-node-app
     ```

## Jenkins Pipeline Example  
  You can use Jenkins to automate the build and deployment of this application with Docker. Here's an example pipeline:  
  
      ```bash
         pipeline {
            agent any
            stages {
                stage('Clone Repository') {
                    steps {
                        git 'https://github.com/your-username/your-nodejs-repo.git'
                    }
                }
                stage('Build Docker Image') {
                    steps {
                        script {
                            sh 'docker build -t node-app .'
                        }
                    }
                }
                stage('Run Docker Container') {
                    steps {
                        script {
                            sh 'docker run -d -p 3000:3000 --name running-node-app node-app'
                        }
                    }
                }
            }
            post {
                always {
                    script {
                        sh 'docker stop running-node-app || true'
                        sh 'docker rm running-node-app || true'
                    }
                }
            }
        }

This pipeline will build and run the application inside a Docker container and clean up the container after the build is complete.

## License  

This project is licensed under the MIT License. See the LICENSE file for details.
# node-jenkins
