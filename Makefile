HELM      			?= helm3
HELM_OUTPUT_DIR     ?= tmp

VERSION   ?= 0.0.1-local
export 

# helm

dex-helm-%:
	@$(MAKE) -f dex/helm.mk $*