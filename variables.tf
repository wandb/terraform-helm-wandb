variable "spec" {
  type        = any
  description = "Specification used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details."
}

variable "wandb_namespace" {
  type        = string
  default     = "default"
  description = "Kubernetes namespace where the operator will be deployed. By default, it uses the `default` namespace."
}

variable "wandb_fqdn" {
  type        = string
  description = "The FQDN to the W&B application"
}

variable "wandb_cloud" {
  type = string
  validation {
    condition     = can(regex("^(google|aws|azure)$", var.wandb_cloud))
    error_message = "The cloud provider must be one of google, aws, or azure"
  }
  description = "The cloud provider to use."
}

variable "operator_namespace" {
  type        = string
  default     = "wandb"
  description = "Kubernetes namespace where the operator CRD's will be deployed. By default, it uses the `default` namespace."
}

variable "operator_image_tag" {
  type        = string
  default     = "1.2.12"
  description = "wandb/controller image tag"
}

variable "operator_version" {
  type        = string
  default     = "0.1.6"
  description = "https://github.com/wandb/helm-charts/tree/main/charts/operator helm chart version"
}
