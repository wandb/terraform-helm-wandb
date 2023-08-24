resource "helm_release" "operator" {
  name             = "operator"
  chart            = "operator"
  repository       = "https://charts.wandb.ai"
  version          = var.operator_chart_version
  namespace        = var.operator_namespace
  create_namespace = true
  wait             = true
  atomic           = false
  cleanup_on_fail  = false
  disable_webhooks = true
  verify           = false

  set {
    name  = "image.tag"
    value = var.controller_image_tag
  }
}

resource "helm_release" "wandb" {
  name  = "wandb-cr"
  chart = "wandb-cr"

  force_update = true

  repository = path.module
  namespace  = var.wandb_namespace

  create_namespace = true
  wait             = true

  set {
    name  = "wandbName"
    value = "wandb"
  }

  set {
    name  = "domain"
    value = var.wandb_fqdn
  }

  set {
    name  = "cloud"
    value = var.wandb_cloud
  }

  set {
    name  = "spec"
    value = yamlencode(var.spec)
    type  = "string"
  }

  depends_on = [helm_release.operator]
}