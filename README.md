# simple-k8s

An example of a simple Kubernetes cluster built with kind.

### Tech stack
- [Pulumi](https://www.pulumi.com/) → for infrastructure as code
- [kind](https://kind.sigs.k8s.io/) → for local kubernetes cluster
- [Spring Boot](https://spring.io/projects/spring-boot) → for simple microservices
- [Docker](https://www.docker.com/) → for containers

### How to build example cluster
1. start the local cluster with `kind create cluster --name simple-k8s`
2. Navigate into `iac/k8s-dashboard`
3. Use local filesystem backend for state files with `pulumi login --local`, 
4. Deploy [Kubernetes dashboard](https://github.com/kubernetes/dashboard) with `pulumi up`
5. Navigate into `iac/microservice-1-k8s`
6. Deploy microservice-1 on kubernetes with `pulumi up`
7. Navigate into `iac/microservice-2-k8s`
8. Deploy microservice-2 on kubernetes with `pulumi up`
