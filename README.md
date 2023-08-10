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
| <a name="input_operator_image_tag"></a> [operator\_image\_tag](#input\_operator\_image\_tag) | wandb/controller image tag | `string` | `"1.2.13"` | no |
| <a name="input_operator_namespace"></a> [operator\_namespace](#input\_operator\_namespace) | Kubernetes namespace where the operator CRD's will be deployed. By default, it uses the `default` namespace. | `string` | `"wandb"` | no |
| <a name="input_operator_version"></a> [operator\_version](#input\_operator\_version) | https://github.com/wandb/helm-charts/tree/main/charts/operator helm chart version | `string` | `"0.1.6"` | no |
| <a name="input_spec"></a> [spec](#input\_spec) | Specification used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details. | `any` | n/a | yes |
| <a name="input_wandb_cloud"></a> [wandb\_cloud](#input\_wandb\_cloud) | The cloud provider to use. | `string` | n/a | yes |
| <a name="input_wandb_fqdn"></a> [wandb\_fqdn](#input\_wandb\_fqdn) | The FQDN to the W&B application | `string` | n/a | yes |
| <a name="input_wandb_namespace"></a> [wandb\_namespace](#input\_wandb\_namespace) | Kubernetes namespace where the operator will be deployed. By default, it uses the `default` namespace. | `string` | `"default"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
