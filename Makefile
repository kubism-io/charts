HELM      			?= helm3
HELM_OUTPUT_DIR     ?= tmp

VERSION   ?= 0.0.1-local
export 

# helm

helm-add-kubism:
	@$(HELM) repo add kubism.io https://kubism.github.io/charts/
	@$(HELM) repo update

dex-helm-%:
	@$(MAKE) -f dex/helm.mk $*