#!/bin/bash

# # CONFIGURE PROMETHEUS & GRAFANA
# kubectl create namespace monitoring 
# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update
# helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
# # sleep 60
# kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090 & \
# kubectl port-forward svc/prometheus-grafana -n monitoring 3001:80 &


# CONFIGURE PROMETHEUS & GRAFANA
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
# Install stack & assign LoadBalancers to Prometheus & Grafana services
helm install prometheus-community/kube-prometheus-stack \
--create-namespace --namespace prometheus \
--generate-name \
--set prometheus.service.type=LoadBalancer \
--set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
--set grafana.service.type=LoadBalancer \
--set grafana.adminpassword=admin
# Retrieve & display the LoadBalancers' URLs
export PROMETHEUS_URL=$(kubectl get svc -n prometheus -l app=kube-prometheus-stack-prometheus -o jsonpath='{.items[].status.loadBalancer.ingress[].ip}')
export GRAFANA_URL=$(kubectl get svc -n prometheus -l app.kubernetes.io/name=grafana -o jsonpath='{.items[].status.loadBalancer.ingress[].ip}')
echo Prometheus URL: http://$PROMETHEUS_URL:9090
echo Grafana URL: http://$GRAFANA_URL
