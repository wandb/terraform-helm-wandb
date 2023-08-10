variable "spec" {
  type        = object
  description = "Specifications used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details."
}

variable "instance" {
  type = object({
    version   = string
    namespace = string
    fqdn      = string
    cloud     = string
  })
  default = {
    version   = "0.1.6"
    namespace = "default"
    #fqdn           = "" # You may want to set a default value here
    #cloud          = "" # You may want to set a default value here
  }
  validation {
    condition     = can(regex("^(gcp|aws|azure)$", var.instance.cloud))
    error_message = "The cloud provider must be one of gcp, aws, or azure."
  }
  description = "Configuration for the instance, including version, namespace, FQDN of the wandb server, and cloud provider."
}

variable "operator" {
  type = object({
    namespace        = string
    image_tag        = string
    operator_version = string
  })
  default = {
    namespace        = "wandb"
    image_tag        = "1.2.12"
    operator_version = "0.1.6"
  }
  description = "Configuration for the operator, including Kubernetes namespace, wandb/controller image tag, and operator version. See `https://github.com/wandb/helm-charts/tree/main/charts/operator` helm chart for details."
}
