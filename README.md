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

### How to access kubernetes dashboard
1. Get monitoring-user access token with `kubectl get secret monitoring-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d`
2. Start port forwarding with `kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443`
3. Open localhost:8443 on a web browser
4. Enter `Bearer <access token>` for the bearer token and log into dashboard
