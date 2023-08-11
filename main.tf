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
    value = var.controler_image_tag
  }
}

resource "helm_release" "wandb" {
  name  = "wandb"
  chart = "operator"

  force_update = true

  repository = path.module
  namespace  = var.wandb_namespace

  create_namespace = true
  wait             = true

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
