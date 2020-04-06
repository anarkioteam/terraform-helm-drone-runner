variable "kubernetes_drone_namespace" {
  description = "Namespace to release Drone runner into"
  type        = string
  default     = "drone"
}

variable "helm_drone_runner_chart_version" {
  description = "Drone runner helm chart version to use"
  type        = string
  default     = ""
}

variable "drone_runner_host" {
  description = "Hostname for Drone runner (will be utilised in ingress if enabled)"
  type        = string
}

variable "drone_rpc_secret" {
  description = "Unique shared secret (see Drone installation guide)"
  type        = string
}

variable "drone_runner_ingress_class" {
  description = "Ingress class to use for Drone runner"
  type        = string
  default     = "nginx"
}

variable "drone_runner_ingress_enabled" {
  description = "Enable/disable Drone runner ingress"
  type        = bool
  default     = true
}

variable "drone_runner_ingress_tls_acme_enabled" {
  description = "Enable/disable acme TLS for ingress"
  type        = string
  default     = "true"
}

variable "drone_runner_ingress_tls_secret_name" {
  description = "Secret name for Drone runner TLS cert"
  type        = string
  default     = "drone-runner-cert"
}
