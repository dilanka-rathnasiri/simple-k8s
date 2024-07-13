import * as k8s from "@pulumi/kubernetes";
import {Deployment} from "@pulumi/kubernetes/apps/v1/deployment";
import {Service} from "@pulumi/kubernetes/core/v1";

const k8sDeployment = (serviceName: string, containerPort: number):void => {
  const ms1AppLabels = {app: serviceName};
  const deployment: Deployment = new k8s.apps.v1.Deployment(`${serviceName}-deployment`, {
    metadata: {
      name: `${serviceName}-deployment`
    },
    spec: {
      selector: {matchLabels: ms1AppLabels},
      replicas: 1,
      template: {
        metadata: {labels: ms1AppLabels},
        spec: {
          containers: [{
            name: serviceName,
            image: `dilankarathnasiri/spring-k8s:${serviceName}`,
            ports: [{containerPort: containerPort}]
          }]
        }
      }
    }
  });

  const service: Service= new k8s.core.v1.Service(`${serviceName}-service`, {
    metadata: {
      name: `${serviceName}-service`,
    },
    spec: {
      ports: [{
        port: 80,
        protocol: "TCP",
        targetPort: containerPort
      }],
      selector: ms1AppLabels
    }
  }, {dependsOn: [deployment]});
}

export default k8sDeployment;
