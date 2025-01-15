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
  type        = bool
  default     = true
  description = "Enable or disable applying and releasing Helm chart"
}

## Redis

variable "use_redis_in_cluster" {
  type        = bool
  default     = false
  description = "Enable or disable redis in cluster"
}

variable "redis_service_name_prefix" {
  type        = string
  default     = null
  description = "Prefix of the redis service name"
}

variable "redis_master_name" {
  type        = string
  default     = null
  description = "Name of the redis master that sentinel uses to monitor"
}

variable "redis_chart_version" {
  type        = string
  default     = "20.6.1"
  description = "Bitnami redis chart version"
}
