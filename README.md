# terraform-helm-wandb

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="provider_helm"></a> [helm](#provider_helm) | n/a     |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name                                                                                    | Description                                                                                                                            | Type         | Default     | Required |
| --------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ------------ | ----------- | :------: |
| <a name="input_operator_image_tag"></a> [operator_image_tag](#input_operator_image_tag) | wandb/controller image tag                                                                                                             | `string`     | `"1.2.12"`  |    no    |
| <a name="input_operator_namespace"></a> [operator_namespace](#input_operator_namespace) | Kubernetes namespace where the operator CRD's will be deployed. By default, it uses the `default` namespace.                           | `string`     | `"wandb"`   |    no    |
| <a name="input_operator_version"></a> [operator_version](#input_operator_version)       | https://github.com/wandb/helm-charts/tree/main/charts/operator helm chart version                                                      | `string`     | `"0.1.6"`   |    no    |
| <a name="input_spec"></a> [spec](#input_spec)                                           | Specifications used in the helm release for the instance. see https://github.com/wandb/cdk8s/blob/main/config-schema.json for details. | `object({})` | n/a         |   yes    |
| <a name="input_wandb_cloud"></a> [wandb_cloud](#input_wandb_cloud)                      | The cloud provider to use.                                                                                                             | `string`     | n/a         |   yes    |
| <a name="input_wandb_fqdn"></a> [wandb_fqdn](#input_wandb_fqdn)                         | The FQDN to the W&B application                                                                                                        | `string`     | n/a         |   yes    |
| <a name="input_wandb_namespace"></a> [wandb_namespace](#input_wandb_namespace)          | Kubernetes namespace where the operator will be deployed. By default, it uses the `default` namespace.                                 | `string`     | `"default"` |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
