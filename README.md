# Kubism.io Helm Charts

The URL of the chart repository is [https://kubism.github.io/charts/](https://kubism.github.io/charts/).

For more information about installing and using Helm, see the
[Helm Docs](https://helm.sh/docs/). For a quick introduction to Charts, see the [Chart Guide](https://helm.sh/docs/topics/charts/).

## Development

When developing charts, the `Makefile` comes in handy to template/install/uninstall charts with ease. The following example renders the `dex` helm chart:

```sh
$ make dex-helm-template
wrote tmp/dex/templates/serviceaccount.yaml
wrote tmp/dex/templates/secret.yaml
wrote tmp/dex/templates/clusterrole.yaml
wrote tmp/dex/templates/clusterrolebinding.yaml
wrote tmp/dex/templates/role.yaml
wrote tmp/dex/templates/rolebinding.yaml
wrote tmp/dex/templates/service.yaml
wrote tmp/dex/templates/deployment.yaml
wrote tmp/dex/templates/config-openssl.yaml
wrote tmp/dex/templates/job-grpc-certs.yaml
wrote tmp/dex/templates/job-web-certs.yaml
```

The following targets are defined:

| target | Description |
| --------- | ----------- |
| `helm-add-kubism` | Add the kubism helm repository to the local list of repos |
| `<chartname>-helm-template` | Templates the helm chart to `tmp/<chartname>` |
| `<chartname>-helm-install` | Installs the helm chart to namespace `<chartname>` with current `kubecontext` and helm3 |
| `<chartname>-helm-uninstall` | Uninstalls the helm chart from namespace `<chartname>` |
| `<chartname>-helm-clean` | Clears `tmp/<chartname>` |
| `<chartname>-helm-dependencies` | Does a helm dep update for `<chartname>` |
