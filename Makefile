BUILD_PATH ?= $(shell pwd)

HELM      			?= helm3
HELM_OUTPUT_DIR     ?= $(BUILD_PATH)/tmp

export 

# helm

helm-add-kubism:
	@$(HELM) repo add kubism.io https://kubism.github.io/charts/
	@$(HELM) repo update

helm-lint:
	$(HELM) lint charts/*

helm-publish: $(HELM3)
	./ci/publish.sh

dex-helm-%:
	@$(MAKE) -C charts -f dex/helm.mk $*