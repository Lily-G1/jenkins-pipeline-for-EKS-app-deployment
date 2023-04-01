variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
#   default = "sockshop-eks-demo"
  default = "eks-cluster-demo"
  type    = string
}

variable "node_ami_type" {
  default = "AL2_x86_64"
  type    = string
}

# variable "instance_type" {
#   default = ["t3.medium"]
#   type    = string
# }
