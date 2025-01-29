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
| <a name="input_controller_image_tag"></a> [controller\_image\_tag](#input\_controller\_image\_tag) | wandb/controller image tag | `string` | `"latest"` | no |
| <a name="input_create_redis_in_cluster"></a> [create\_redis\_in\_cluster](#input\_create\_redis\_in\_cluster) | Create redis in cluster | `bool` | `false` | no |
| <a name="input_enable_helm_release"></a> [enable\_helm\_release](#input\_enable\_helm\_release) | Enable or disable applying and releasing Helm chart | `bool` | `true` | no |
| <a name="input_operator_chart_namespace"></a> [operator\_chart\_namespace](#input\_operator\_chart\_namespace) | Kubernetes namespace where the operator CRD's will be deployed. By default, it uses the `default` namespace. | `string` | `"wandb"` | no |
| <a name="input_operator_chart_version"></a> [operator\_chart\_version](#input\_operator\_chart\_version) | https://github.com/wandb/helm-charts/tree/main/charts/operator helm chart version | `string` | `"latest"` | no |
| <a name="input_redis_chart_version"></a> [redis\_chart\_version](#input\_redis\_chart\_version) | Bitnami redis chart version | `string` | `"20.6.1"` | no |
| <a name="input_redis_master_name"></a> [redis\_master\_name](#input\_redis\_master\_name) | Name of the redis master that sentinel uses to monitor | `string` | `null` | no |
| <a name="input_redis_service_name_prefix"></a> [redis\_service\_name\_prefix](#input\_redis\_service\_name\_prefix) | Prefix of the redis service name | `string` | `null` | no |
| <a name="input_spec"></a> [spec](#input\_spec) | Specification used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details. | `any` | n/a | yes |
| <a name="input_wandb_namespace"></a> [wandb\_namespace](#input\_wandb\_namespace) | Kubernetes namespace where the operator will be deployed. By default, it uses the `default` namespace. | `string` | `"default"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
