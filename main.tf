resource "helm_release" "operator" {
  name             = "operator"
  chart            = "operator"
  repository       = "https://charts.wandb.ai"
  version          = var.operator_chart_version
  namespace        = var.operator_chart_namespace
  create_namespace = true
  wait             = true
  atomic           = false
  cleanup_on_fail  = false
  disable_webhooks = true
  verify           = false
  // note: use count to enforce whether helm is used for release
  count = var.enable_helm_operator ? 1 : 0

  set {
    name  = "image.tag"
    value = var.controller_image_tag
  }

  set {
    name  = "image.repository"
    value = var.controller_image_repository
  }
}

resource "helm_release" "wandb" {
  name  = "wandb-cr"
  chart = "wandb-cr"

  count = var.enable_helm_wandb ? 1 : 0

  force_update = true

  repository = path.module
  namespace  = var.wandb_namespace

  create_namespace = true
  wait             = true

  set {
    name  = "name"
    value = "wandb"
  }

  set {
    name  = "spec"
    value = yamlencode(var.spec)
    type  = "string"
  }

  depends_on = [local.helm_release_operator]
}

locals {
  helm_release_wandb    = one(helm_release.wandb[*])
  helm_release_operator = one(helm_release.operator[*])
}

moved {
  from = helm_release.operator
  to   = helm_release.operator[0]
}

moved {
  from = helm_release.wandb
  to   = helm_release.wandb[0]
}
