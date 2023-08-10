resource "helm_release" "operator" {
  name             = "operator"
  chart            = "operator"
  repository       = "https://charts.wandb.ai"
  version          = var.operator.operator_version
  namespace        = var.operator.namespace
  create_namespace = true
  wait             = true

  set {
    name  = "image.tag"
    value = var.operator.image_tag
  }
}

locals {
  spec = yamlencode(var.spec)
}

resource "helm_release" "instance" {
  name       = "wandb"
  chart      = "operator"
  repository = path.module

  namespace        = var.instance.namespace
  create_namespace = true
  wait             = true

  set {
    name  = "domain"
    value = var.instance.fqdn
  }

  set {
    name  = "cloud"
    value = var.instance.cloud
  }

  set {
    name  = "spec"
    value = local.spec
    type  = "string"
  }

  depends_on = [helm_release.operator]
}
