**GoLang-Sample-App**
An sample Golang hello application to test GitHub workflows


**Initialize the GoLang Repository:**
$-go mod init github.com/Raghu-L/GoLang-Sample-App.git
Run the Code Locally:
go run main.go


**Dockerfile** for Multi-Stage Build:
Create a Dockerfile with a multi-stage build. In the first stage, build the GoLang binary, and in the second stage, copy it to Google's Distroless image, containing only your application and its runtime dependencies.

Dockerfile

# First stage: Build GoLang binary
FROM golang:latest AS builder
WORKDIR /app
COPY . .
# Second stage: Copy to Distroless image
FROM gcr.io/distroless/base
COPY --from=builder /app/app /
CMD ["/app"]


**Amazon ECR Repository Setup:**

Create an Amazon ECR repository associated with a user having the necessary permissions.
Enable scan to push and implement KMS encryption for added code scan and security.
Add the secret key and access key to GitHub Secrets.


**Protect the Master Branch on GitHub:**
Require status checks to pass before merging.
Require a pull request before merging.
