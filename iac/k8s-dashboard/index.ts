import * as k8s from "@pulumi/kubernetes";

const dashboardNamespace = new k8s.core.v1.Namespace(
  "kubernetes-dashboard",
  {
    metadata: {
      name: "kubernetes-dashboard",
    },
  },
);
const dashboardChart = new k8s.helm.v4.Chart(
  "kubernetes-dashboard",
  {
    chart: "kubernetes-dashboard",
    namespace: "kubernetes-dashboard",
    repositoryOpts: {
      repo: "https://kubernetes.github.io/dashboard/",
    },
  },
  { dependsOn: [dashboardNamespace] },
);
