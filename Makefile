
# Google K8s Engine (GKE)
build-gke:
	rm -f demo.yaml
	kustomize build gke > gke.yaml

deploy-gke:
	kubectl --context=${K8S_CONTEXT} apply -f gke.yaml

undeploy-gke:
	kubectl --context=${K8S_CONTEXT} delete -f gke.yaml

# AWS Elastic K8s Service (EKS)
build-aws-eks:
	rm -f demo.yaml
	kustomize build aws-eks > aws-eks.yaml

deploy-aws-eks:
	kubectl --context=${K8S_CONTEXT} apply -f aws-eks.yaml

undeploy-aws-eks:
	kubectl --context=${K8S_CONTEXT} delete -f aws-eks.yaml
