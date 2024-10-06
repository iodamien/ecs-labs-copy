#!/bin/bash
sudo useradd -m bob 
sudo echo "bob:bob123" | sudo chpasswd
sudo apt-get update
sudo apt install nginx -y
echo "bob  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/bob