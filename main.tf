resource "kubernetes_namespace" "drone" {
  metadata {
    name = var.kubernetes_drone_namespace
  }
}

resource "helm_release" "drone_runner" {
  depends_on = [kubernetes_namespace.drone]

  name       = "drone-runner"
  repository = data.helm_repository.drone.metadata[0].name
  chart      = "drone-runner-kube"
  namespace  = var.kubernetes_drone_namespace
  version    = var.helm_drone_runner_chart_version == "" ? null : var.helm_drone_runner_chart_version

  values = [
    templatefile(
      "${path.module}/templates/values.yaml.tpl",
      {
        "kubernetes_drone_namespace" = var.kubernetes_drone_namespace
        "drone_runner_host"          = var.drone_runner_host

        "drone_runner_ingress_enabled"          = var.drone_runner_ingress_enabled
        "drone_runner_ingress_tls_acme_enabled" = var.drone_runner_ingress_tls_acme_enabled
        "drone_runner_ingress_class"            = var.drone_runner_ingress_class
        "drone_runner_ingress_tls_secret_name"  = var.drone_runner_ingress_tls_secret_name
      }
    )
  ]

  set_sensitive {
    name  = "env.DRONE_RPC_SECRET"
    value = var.drone_rpc_secret
  }
}
