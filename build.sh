ECR_REGISTRY="385572795769.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t aws_aula_victor_soares .
docker tag aws_aula_victor_soares:latest $ECR_REGISTRY/aws_aula_victor_soares:latest
docker push $ECR_REGISTRY/aws_aula_victor_soares:latest