import time

from kubernetes import client, config


def is_kourier_gateway_ready(app_v1_api: client.AppsV1Api) -> bool:
    try:
        deploy = app_v1_api.read_namespaced_deployment(
            name="3scale-kourier-gateway", namespace="knative-serving"
        )
        return deploy.status.ready_replicas == deploy.status.replicas
    except:
        return False


def main():
    # load kube config
    config.load_kube_config()

    # create apps v1 api client
    app_v1_api = client.AppsV1Api()

    # wait until kourier gateway is ready
    while not (is_kourier_gateway_ready(app_v1_api)):
        print("******* kourier gateway isn't ready yet *******")
        time.sleep(5)

    print("******* kourier gateway is ready *******")


if __name__ == "__main__":
    main()
