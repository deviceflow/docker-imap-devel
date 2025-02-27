set dotenv-load := true

#IMAGE_NAME := "${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/df-imap-test"
IMAGE_NAME := "dimfeld/imap-smtp-test"

build-docker:
  docker buildx build --platform=linux/amd64,linux/arm64 -t {{IMAGE_NAME}}:1.1 .

# push-docker:
#   aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com && \
#     docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/df-imap-test:1.1

push-docker:
  docker push {{IMAGE_NAME}}:1.1
