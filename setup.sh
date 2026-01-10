# conda create -n vlm-r1 python=3.11 
# conda activate vlm-r1

#!/bin/bash

# Update package list
sudo apt update
sudo apt install software-properties-common

# Add deadsnakes PPA
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

# Install Python 3.9 and required packages
sudo apt install python3.10 python3.10-dev python3.10-venv

# Create virtual environment
python3.10 -m venv env

# Activate virtual environment
source env/bin/activate

# Install the packages in open-r1-multimodal .
cd src/open-r1-multimodal # We edit the grpo.py and grpo_trainer.py in open-r1 repo.
pip install -e ".[dev]"

# Addtional modules
pip install wandb==0.18.3
pip install tensorboardx
pip install qwen_vl_utils torchvision
pip install flash-attn --no-build-isolation
pip install babel
pip install python-Levenshtein
pip install matplotlib
pip install pycocotools
pip install openai
pip install httpx[socks]