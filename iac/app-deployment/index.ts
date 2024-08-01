import * as k8s from "@pulumi/kubernetes";
import { Deployment } from "@pulumi/kubernetes/apps/v1/deployment";
import { Service } from "@pulumi/kubernetes/core/v1";

const k8sDeployment = (serviceName: string, dockerUrl: string): void => {
  const ms1AppLabels = { app: serviceName };
  const containerPort = 5000;
  const deployment: Deployment = new k8s.apps.v1.Deployment(
    `${serviceName}-deployment`,
    {
      metadata: {
        name: `${serviceName}-deployment`,
      },
      spec: {
        selector: { matchLabels: ms1AppLabels },
        replicas: 2,
        template: {
          metadata: { labels: ms1AppLabels },
          spec: {
            containers: [
              {
                name: serviceName,
                image: dockerUrl,
                ports: [{ containerPort: containerPort }],
                env: [{ name: "SERVICE_NAME", value: serviceName }],
              },
            ],
          },
        },
      },
    },
  );

  const service: Service = new k8s.core.v1.Service(
    `${serviceName}-service`,
    {
      metadata: {
        name: `${serviceName}-service`,
      },
      spec: {
        ports: [
          {
            port: 80,
            protocol: "TCP",
            targetPort: containerPort,
          },
        ],
        selector: ms1AppLabels,
      },
    },
    { dependsOn: [deployment] },
  );
};

k8sDeployment("audi", "dilankarathnasiri/simple-k8s:latest");
k8sDeployment("benz", "dilankarathnasiri/simple-k8s:latest");
