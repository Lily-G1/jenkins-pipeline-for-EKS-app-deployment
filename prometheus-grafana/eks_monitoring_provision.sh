#!/bin/bash

# # INSTALL HELM
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# sudo chmod 700 get_helm.sh
# sudo ./get_helm.sh

# CONFIGURE PROMETHEUS
kubectl create namespace monitoring 
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090

# CONFIGURE GRAFANA
kubectl port-forward svc/monitoring-grafana -n monitoring 3001:80
