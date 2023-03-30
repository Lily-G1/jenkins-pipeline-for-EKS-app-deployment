#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create EKS Cluster") {
            steps {
                script {
                    dir('terraform2') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy Sock-Shop App to EKS Cluster") {
            steps {
                script {
                    dir('kubernetes-sockshop') {
                        sh "aws eks update-kubeconfig --region us-east-1 --name sockshop-eks-demo"
                        sh "kubectl create namespace sock-shop"
                        sh "kubectl apply -f complete-demo.yaml"
                    }
                }
            }
        }
        stage("Deploy Web App to EKS Cluster") {
            steps {
                script {
                    dir('kubernetes-webapp') {
//                         sh "aws eks update-kubeconfig --region us-east-1 --name webapp-eks-cluster"
                        sh "kubectl apply -f database.yaml"
                        sh "kubectl apply -f web.yaml"
                    }
                }
            }
        }
    }
}
