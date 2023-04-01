#!/bin/bash

# CONFIGURE PROMETHEUS & GRAFANA
# kubectl create namespace monitoring 
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
sleep 60
kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090
kubectl port-forward svc/monitoring-grafana -n monitoring 3001:80
