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
  count            = var.enable_helm_release ? 1 : 0

  set {
    name  = "image.tag"
    value = var.controller_image_tag
  }
}

resource "helm_release" "wandb" {
  name  = "wandb-cr"
  chart = "wandb-cr"

  count = var.enable_helm_release ? 1 : 0

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


resource "helm_release" "redis_in_cluster" {
  count            = var.use_redis_in_cluster ? 1 : 0
  name             = var.redis_service_name_prefix
  namespace        = var.wandb_namespace
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "redis"
  version          = var.redis_chart_version

  create_namespace = true
  wait             = true
  cleanup_on_fail  = false
  force_update     = true


  set {
    name  = "namespaceOverride"
    value = var.wandb_namespace
  }

  set {
    name = "sentinel.masterSet"
    value = var.redis_master_name
  }

  set {
    name  = "sentinel.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }

  set {
    name  = "replica.replicaCount"
    value = 3
  }

  set {
    name  = "auth.enabled"
    value = "false"
  }

  set {
    name  = "auth.sentinel"
    value = "false"
  }
}


moved {
  from = helm_release.operator
  to   = helm_release.operator[0]
}

moved {
  from = helm_release.wandb
  to   = helm_release.wandb[0]
}
