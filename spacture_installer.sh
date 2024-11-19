#!/bin/bash

# Script for installing Docker on Ubuntu

# Update package index
echo "Updating package index..."
sudo apt-get update -y

# Install required packages for Docker
echo "Installing prerequisites (ca-certificates and curl)..."
sudo apt-get install -y ca-certificates curl

# Create directory for Docker's GPG key
echo "Creating directory for Docker's GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker’s official GPG key
echo "Adding Docker’s official GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the Docker repository to Apt sources
echo "Adding Docker repository to sources list..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index after adding Docker repository
echo "Updating package index after adding Docker repository..."
sudo apt-get update -y

# Install Docker Engine and additional plugins
echo "Installing Docker Engine and plugins (docker-ce, docker-ce-cli, containerd.io, docker-buildx-plugin, docker-compose-plugin)..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify Docker installation by running the hello-world container
echo "Verifying Docker installation by running 'hello-world' container..."
sudo docker run hello-world

echo "Docker installation completed successfully!"

#########################
sudo apt install git -y

# Script for installing Google Cloud SDK on Ubuntu

# Update package index
echo "Updating package index..."
sudo apt-get update -y

# Install required packages
echo "Installing prerequisites (apt-transport-https, ca-certificates, gnupg, curl)..."
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

# Add Google Cloud SDK’s official GPG key
echo "Adding Google Cloud SDK’s official GPG key..."
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add the Google Cloud SDK repository to Apt sources
echo "Adding Google Cloud SDK repository to sources list..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Update package index after adding Google Cloud SDK repository
echo "Updating package index after adding Google Cloud SDK repository..."
sudo apt-get update -y

# Install Google Cloud CLI
echo "Installing Google Cloud CLI..."
sudo apt-get install -y google-cloud-cli

# Authenticate using Service Account JSON
# Replace '/path/to/your/service-account.json' with the path to your actual JSON key file
export GOOGLE_APPLICATION_CREDENTIALS="/home/spactureai/Desktop/client/spacture-cfee1ebd2fb0.json"

echo "Authenticating using service account JSON..."
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

# Set default project ID (replace [PROJECT_ID] with your actual project ID)
echo "Setting default project..."
gcloud config set project spacture

echo "Google Cloud SDK installation and authentication completed successfully!"

####################
#!/bin/bash

# Script for installing Python 3.10 from deadsnakes PPA and pip

# Step 1: Update package index
echo "Updating package index..."
sudo apt update -y

# Step 2: Install software-properties-common
echo "Installing software-properties-common..."
sudo apt install -y software-properties-common

# Step 3: Add the deadsnakes PPA for newer Python versions
echo "Adding deadsnakes PPA..."
sudo add-apt-repository ppa:deadsnakes/ppa -y

# Step 4: Update package index again after adding PPA
echo "Updating package index after adding deadsnakes PPA..."
sudo apt update -y

# Step 5: Install Python 3.10 and related packages
echo "Installing Python 3.10 and related packages..."
sudo apt install -y python3.10 python3.10-venv python3.10-distutils

# Step 6: Install pip for Python 3.10
echo "Installing pip for Python 3.10..."
curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.10

echo "Python 3.10 and pip installation completed successfully!"
#######################
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-ubuntu2404.pin
sudo mv cuda-ubuntu2404.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.6.2/local_installers/cuda-repo-ubuntu2404-12-6-local_12.6.2-560.35.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2404-12-6-local_12.6.2-560.35.03-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2404-12-6-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-6 

###############

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit

sudo apt-get install -y nvidia-cuda-toolkit
