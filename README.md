# GitOps CI/CD Pipeline
Branch Structure
#### 1. Created two branches: one for code and another for Helm charts, Dockerfile, and ArgoCD manifest.
#### 2. Created a dev branch and a workflow that triggers the pipeline based on push events. Here, I used a reusable workflow placed in a separate branch.
# Continuous Integration Pipeline
#### 1. Once there is a push event in the dev branch, it triggers the pipeline in the workflow branch, which will dockerize the application. I have used a multi-stage Dockerfile here.
#### 2. Once it is dockerized, it is pushed to the Docker Hub repository:
#### Docker Hub Repository Name: pramod00d
# Image Name: pramod003/node-hello-world
#### 3. Added Docker Scout to check the vulnerabilities in Docker images.
#### 4. Used semantic versioning for the image tag (npm version) and updated the version in the dev branch.
#### 5. Each time a push is made, the commit message is captured, and based on that, a version bump is made (major, minor, patch).
#### 6. The Docker image is built with the updated version and pushed to Docker Hub.
#### 7. This version is exported as output to use in the deployment pipeline.
# Continuous Deployment
#### 1. In continuous deployment, a Helm chart is added.
#### 2. In this pipeline, I updated the chart version in chart.yaml.
#### 3. For deployment, we have two methods: one with manifests and the other with the ArgoCD CLI method.
#### 4. I have used the ArgoCD CLI method to deploy the charts to ArgoCD, also deployed using manifests.
# Deployment via Declarative way
#### kubectl apply -n argocd -f argocd.yaml
# Secrets & Environments Used
#### 1. Docker Hub: Username and Password
#### 2. GitHub: Username and PAT token
#### 3. ArgoCD: URL, Username, and Password
#### 4. GitHub branch name for the image tag
#### 5. Commit message for semantic versioning

## Refered docs:
#### 1. https://docs.docker.com/build/ci/github-actions/
#### 2. https://docs.docker.com/scout/integrations/ci/gha/
#### 3. https://docs.github.com/en/actions/using-workflows/reusing-workflows
#### 4. https://argo-cd.readthedocs.io/en/release-1.8/user-guide/commands/argocd_app_manifests/
#### 5. https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd/
