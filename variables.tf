variable "spec" {
  type        = any
  description = "Specification used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details."
}

variable "wandb_namespace" {
  type        = string
  default     = "default"
  description = "Kubernetes namespace where the operator will be deployed. By default, it uses the `default` namespace."
}

variable "controller_image_tag" {
  type        = string
  default     = "latest"
  description = "wandb/controller image tag"
}

variable "operator_chart_namespace" {
  type        = string
  default     = "wandb"
  description = "Kubernetes namespace where the operator CRD's will be deployed. By default, it uses the `default` namespace."
}

variable "operator_chart_version" {
  type        = string
  default     = "latest"
  description = "https://github.com/wandb/helm-charts/tree/main/charts/operator helm chart version"
}

variable "enable_helm_release" {
  type        = boolean
  default     = true
  description = "Enable or disable applying and releasing Helm chart"
}