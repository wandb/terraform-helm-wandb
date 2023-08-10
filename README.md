# terraform-helm-wandb

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance"></a> [instance](#input\_instance) | Configuration for the instance, including version, namespace, FQDN of the wandb server, and cloud provider. | <pre>object({<br>    version   = string<br>    namespace = string<br>    fqdn      = string<br>    cloud     = string<br>  })</pre> | <pre>{<br>  "namespace": "default",<br>  "version": "0.1.6"<br>}</pre> | no |
| <a name="input_operator"></a> [operator](#input\_operator) | Configuration for the operator, including Kubernetes namespace, wandb/controller image tag, and operator version. See `https://github.com/wandb/helm-charts/tree/main/charts/operator` helm chart for details. | <pre>object({<br>    namespace        = string<br>    image_tag        = string<br>    operator_version = string<br>  })</pre> | <pre>{<br>  "image_tag": "1.2.12",<br>  "namespace": "wandb",<br>  "operator_version": "0.1.6"<br>}</pre> | no |
| <a name="input_spec"></a> [spec](#input\_spec) | Specifications used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details. | `object` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
