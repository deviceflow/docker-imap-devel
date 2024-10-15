set dotenv-load := true

build-docker:
  docker build -t ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/df-imap-test:1.0 .

push-docker:
  aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com && \
    docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/df-imap-test:1.0

