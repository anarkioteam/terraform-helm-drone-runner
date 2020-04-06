rbac:
  buildNamespaces:
    - ${ kubernetes_drone_namespace }

env:
  DRONE_NAMESPACE_DEFAULT: ${ kubernetes_drone_namespace }

ingress:
  enabled: ${ drone_runner_ingress_enabled }
  annotations:
    kubernetes.io/ingress.class: ${ drone_runner_ingress_class }
    kubernetes.io/tls-acme: "${ drone_runner_ingress_tls_acme_enabled }"
  hosts:
    - host: ${ drone_runner_host }
      paths:
        - "/"
  tls:
    - secretName: ${ drone_runner_ingress_tls_secret_name }
      hosts:
        - ${ drone_runner_host }
