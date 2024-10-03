FROM jenkins/jenkins:2.452.2-jdk17

USER root

# Update package lists and install lsb-release
RUN apt-get update && apt-get install -y lsb-release

# Add Docker's official GPG key and repository
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli

# Clean up the apt cache to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add the Jenkins user to the Docker group
RUN groupadd -f docker && usermod -aG docker jenkins

# Switch back to Jenkins user
USER jenkins

# Install Blue Ocean and Docker Workflow plugins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

