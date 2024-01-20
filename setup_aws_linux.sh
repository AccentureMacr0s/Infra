#!/bin/bash
# Установка CloudWatch, Postgres 15 и AWS SSM
sudo yum update -y
sudo yum install -y amazon-cloudwatch-agent
sudo amazon-linux-extras install postgresql15
sudo yum install -y amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
