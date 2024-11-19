#!/bin/bash

echo "Starting verification of installed tools..."

# Check Docker Installation
echo "Verifying Docker installation..."
if docker --version &>/dev/null; then
    echo "Docker is installed: $(docker --version)"
else
    echo "Docker is not installed or not working correctly."
fi

# Check Git Installation
echo "Verifying Git installation..."
if git --version &>/dev/null; then
    echo "Git is installed: $(git --version)"
else
    echo "Git is not installed or not working correctly."
fi

# Check Google Cloud CLI Installation
echo "Verifying Google Cloud CLI installation..."
if gcloud --version &>/dev/null; then
    echo "Google Cloud CLI is installed:"
    gcloud --version
else
    echo "Google Cloud CLI is not installed or not working correctly."
fi

# Check Google Cloud Authentication
echo "Verifying Google Cloud authentication..."
if gcloud auth list 2>/dev/null | grep -q ACTIVE; then
    echo "Google Cloud is authenticated. Active account:"
    gcloud auth list | grep ACTIVE
else
    echo "Google Cloud is not authenticated or active account is missing."
fi

# Check Python 3.10 Installation
echo "Verifying Python 3.10 installation..."
if python3.10 --version &>/dev/null; then
    echo "Python 3.10 is installed: $(python3.10 --version)"
else
    echo "Python 3.10 is not installed or not working correctly."
fi

# Check Pip Installation for Python 3.10
echo "Verifying pip installation for Python 3.10..."
if python3.10 -m pip --version &>/dev/null; then
    echo "Pip for Python 3.10 is installed: $(python3.10 -m pip --version)"
else
    echo "Pip for Python 3.10 is not installed or not working correctly."
fi

# Check CUDA Toolkit Installation
echo "Verifying CUDA Toolkit installation..."
if nvcc --version &>/dev/null; then
    echo "CUDA Toolkit is installed:"
    nvcc --version
else
    echo "CUDA Toolkit is not installed or not working correctly."
fi

# Check NVIDIA Container Toolkit Installation
echo "Verifying NVIDIA Container Toolkit installation..."
if nvidia-container-cli --version &>/dev/null; then
    echo "NVIDIA Container Toolkit is installed: $(nvidia-container-cli --version)"
else
    echo "NVIDIA Container Toolkit is not installed or not working correctly."
fi

echo "Verification completed."
