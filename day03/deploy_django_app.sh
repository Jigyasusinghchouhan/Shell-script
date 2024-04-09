#!/bin/bash

# Deploy a Django app and handle errors

# Function to send email notification when deployment fails
send_email_notification() {
    echo "Deployment failed. Sending email notification to admin..."
    echo "Deployment of Django app failed. Please check." | mail -s "Django App Deployment Failed" jigyashu2001@gmail.com
}

# Function to clone the Django app code
code_clone() {
    echo "Cloning the Django app..."
    if [ -d "django-notes-app" ]; then
        echo "The code directory already exists. Skipping clone."
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git || {
            echo "Failed to clone the code."
            return 1
        }
    fi
}

# Function to install required dependencies
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

    # Uncomment the following lines if needed:
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    # sudo systemctl restart docker
}

# Function to deploy the Django app
deploy() {
    echo "Building and deploying the Django app..."
    docker build -t notes-app . && docker-compose up -d || {
        echo "Failed to build and deploy the app."
        send_email_notification
        return 1
    }
}

# Main function
main() {
    code_clone || return 1
    install_requirements || return 1
    required_restarts || return 1
    deploy || return 1
    echo "Django app deployed successfully."
}

# Execute main function
main











































































