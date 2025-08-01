import * as k8s from "@pulumi/kubernetes";

const nsName: string = "kubernetes-dashboard";
const dashboardNamespace = new k8s.core.v1.Namespace(nsName,
  {
    metadata: {
      name: nsName,
    },
  },);

const dashboardChart = new k8s.helm.v4.Chart(nsName,
  {
    chart: "kubernetes-dashboard",
    namespace: nsName,
    repositoryOpts: {
      repo: "https://kubernetes.github.io/dashboard/",
    },
  }, {dependsOn: [dashboardNamespace]},);

const usr = new k8s.core.v1.ServiceAccount("usr", {
  metadata: {
    name: "monitoring-user",
    namespace: nsName
  }
}, {dependsOn: [dashboardNamespace]});

const usrCrb = new k8s.rbac.v1.ClusterRoleBinding("usr-crb", {
  roleRef: {
    apiGroup: "rbac.authorization.k8s.io",
    kind: "ClusterRole",
    name: "view"
  },
  metadata: {
    name: "monitoring-user"
  },
  subjects: [{
    kind: "ServiceAccount",
    name: "monitoring-user",
    namespace: nsName
  }]
}, {dependsOn: [dashboardNamespace, usr]},)

const usrSecret = new k8s.core.v1.Secret("usr-secret", {
  metadata: {
    name: "monitoring-user",
    namespace: nsName,
    annotations: {
      "kubernetes.io/service-account.name": "monitoring-user"
    },
  },
  type: "kubernetes.io/service-account-token"
}, {dependsOn: [dashboardNamespace, usr]});
