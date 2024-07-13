import * as k8s from "@pulumi/kubernetes";

const ms1AppLabels = {app: "microservice-1"};
const ms1Deployment = new k8s.apps.v1.Deployment("microservice-1-deployment", {
  metadata: {
    name: "microservice-1-deployment"
  },
  spec: {
    selector: {matchLabels: ms1AppLabels},
    replicas: 1,
    template: {
      metadata: {labels: ms1AppLabels},
      spec: {
        containers: [{
          name: "microservice-1",
          image: "dilankarathnasiri/spring-k8s:microservice-1",
          ports: [{containerPort: 5000}]
        }]
      }
    }
  }
});

const ms1Service = new k8s.core.v1.Service("microservice-1-service", {
  metadata: {
    name: "microservice-1-service",
  },
  spec: {
    ports: [{
      port: 80,
      protocol: "TCP",
      targetPort: 5000
    }],
    selector: ms1AppLabels
  }
})
