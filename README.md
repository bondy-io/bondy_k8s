# bondy_k8s

> Still in draft, but functional very soon

This repository provides example for depl0ying a Bondy cluster on several Kubernetes services.

The repo uses [Kustomize](https://kustomize.io), a tool that introduces a template-free way to customize application configuration that simplifies the use of off-the-shelf applications. Now, built into `kubectl`.

## Directory Layout

```bash
.
├── Makefile
├── README.md
├── aws-eks
│   └── kustomization.yaml
├── bases
│   ├── bondy
│   └── kustomization.yaml
└── gke
    ├── bondy
    └── kustomization.yaml
```

The repository is organised using Kustomize best practice of layering the configuration.

The `bases` directory contains the skeleton of a Bondy cluster deployment.

The other directories represent the resources to deploy a Bondy cluster in a given K8s service e.g. Google K8s Engine (GKE).

## Using
### Requirements
* A cluster up and running
* `kubectl` installed and configured to access the clsuter

### Building
For simplicity we have included a `Makefile` with the following build targets:

* `build-gke` - builds the K8s manifest for Google K8s Engine (GKE). It outputs a YAML file named `gke.yaml`. If a file existed with that name, the target removes it before building.
* `build-aws-eks` - builds the K8s manifest for AWS Elastice K8s Service (EKS). It outputs a YAML file named `aws-eks.yaml`. If a file existed with that name, the target removes it before building.


#### Usage
```bash
make build-gke
```
or

```bash
make build-aws-eks
```

### Deploy

* `deploy-gke` - uses `kubectl` to apply the `gke.yaml` manifest
* `deploy-aws-eks` - uses `kubectl` to apply the `aws-eks.yaml` manifest

#### Usage
```bash
K8S_CONTEXT=yourCtxt make deploy-gke
```
or

```bash
K8S_CONTEXT=yourCtxt make deploy-aws-eks
```

where `yourCtxt` is your cluster `kubectl` context

### Undeploy

* `undeploy-gke` - uses `kubectl` to delete all the resources previously deployed uaing the `gke.yaml` manifest
* `undeploy-aws-eks` - uses `kubectl` to delete all the resources previously deployed uaing the `aws-eks.yaml` manifest

#### Usage
```bash
K8S_CONTEXT=yourCtxt make undeploy-gke
```
or

```bash
K8S_CONTEXT=yourCtxt make undeploy-aws-eks
```

where `yourCtxt` is your cluster `kubectl` context


