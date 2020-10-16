K8S_NAMESPACE 		?= dex

.PHONY: helm-template-clean helm-dependency-update helm-install helm-uninstall helm-template

clean:
	@rm -Rf $(HELM_OUTPUT_DIR)

dependencies:
	@$(HELM) dep update .

install:
	@$(HELM) upgrade --install dex . --namespace $(K8S_NAMESPACE)

uninstall:
	@$(HELM) uninstall dex --namespace $(K8S_NAMESPACE)

template: helm-template-clean
	@mkdir -p $(HELM_OUTPUT_DIR)
	@$(HELM) template dex $(HELM_PATH) --namespace $(K8S_NAMESPACE) --output-dir $(HELM_OUTPUT_DIR) --include-crds