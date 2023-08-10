resource "helm_release" "operator" {
  name             = "operator"
  chart            = "operator"
  repository       = "https://charts.wandb.ai"
  version          = var.operator_version
  namespace        = var.operator_namespace
  create_namespace = true
  wait             = true

  set {
    name  = "image.tag"
    value = var.operator_image_tag
  }
}

locals {
  spec = yamlencode(var.spec)
}

resource "helm_release" "instance" {
  name       = "wandb"
  chart      = "operator"
  repository = path.module

  namespace        = var.instance_namespace
  create_namespace = true
  wait             = true

  set {
    name  = "domain"
    value = var.fqdn
  }

  set {
    name  = "cloud"
    value = var.instance_cloud
  }

  set {
    name  = "spec"
    value = local.spec
    type  = "string"
  }

  depends_on = [helm_release.operator]
}
