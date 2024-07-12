import * as k8s from "@pulumi/kubernetes";

const ms1AppLabels = { app: "microservice-1" };
const ms1Deployment = new k8s.apps.v1.Deployment("microservice-1", {
    spec: {
        selector: { matchLabels: ms1AppLabels },
        replicas: 1,
        template: {
            metadata: { labels: ms1AppLabels },
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
export const ms1Name = ms1Deployment.metadata.name;
