# terraform-helm-drone-runner

A Terraform module for deploying [Drone Kubernetes runner](https://docs.drone.io/runner/kubernetes/overview/) via Helm.

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | ~> 0.12.0 |
| helm      | ~> 1.1    |
| template  | ~> 2.1    |

## Providers

| Name       | Version |
| ---------- | ------- |
| helm       | ~> 1.1  |
| kubernetes | n/a     |

## Inputs

| Name                                  | Description                                                        | Type     | Default               | Required |
| ------------------------------------- | ------------------------------------------------------------------ | -------- | --------------------- | :------: |
| drone_rpc_secret                      | Unique shared secret (see Drone installation guide)                | `string` | n/a                   |   yes    |
| drone_runner_host                     | Hostname for Drone runner (will be utilised in ingress if enabled) | `string` | n/a                   |   yes    |
| drone_runner_ingress_class            | Ingress class to use for Drone runner                              | `string` | `"nginx"`             |    no    |
| drone_runner_ingress_enabled          | Enable/disable Drone runner ingress                                | `bool`   | `true`                |    no    |
| drone_runner_ingress_tls_acme_enabled | Enable/disable acme TLS for ingress                                | `string` | `"true"`              |    no    |
| drone_runner_ingress_tls_secret_name  | Secret name for Drone runner TLS cert                              | `string` | `"drone-runner-cert"` |    no    |
| helm_drone_runner_chart_version       | Drone runner helm chart version to use                             | `string` | `""`                  |    no    |
| kubernetes_drone_namespace            | Namespace to release Drone runner into                             | `string` | `"drone"`             |    no    |

## Outputs

No output.
