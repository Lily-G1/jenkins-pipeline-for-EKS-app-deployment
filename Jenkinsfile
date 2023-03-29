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
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
//         stage("Deploy Web App to EKS Cluster") {
//             steps {
//                 script {
//                     dir('kubernetes-webapp') {
//                         sh "aws eks update-kubeconfig --name webapp-eks-cluster"
//                         sh "kubectl apply -f database.yaml"
//                         sh "kubectl apply -f web.yaml"
//                     }
//                 }
//             }
//         }
        stage("Deploy Sock-Shop App to EKS Cluster") {
            steps {
                script {
                    dir('kubernetes-sockshop') {
//                         sh "aws eks update-kubeconfig --name sockshop-eks-cluster"
                        sh "aws eks update-kubeconfig --name sockshop-eks-demo"
                        sh "kubectl create namespace sock-shop"
                        sh "kubectl apply -f complete-demo.yaml"
                    }
                }
            }
        }
    }
}
