# resource "null_resource" "eks_cluster_monitoring" {
#     provisioner "local-exec" {
#         command = "sh /eks_monitoring_provision.sh ${aws_eks_cluster.sockshop-eks-demo.cluster_id}"
#     }
#     # depends_on = [
#     #     "${aws_eks_cluster.master-node.name}"
#     # ]
# }


data "aws_eks_cluster" "cluster_id" {
  name = "sockshop-eks-demo"
}

# output "id" {
#   value = data.aws_eks_cluster.sockshop-eks-demo.id
# }

resource "null_resource" "eks_cluster_monitoring" {
    provisioner "local-exec" {
        command = "sh /eks_monitoring_provision.sh ${data.aws_eks_cluster.cluster_id.id}"
    }
    # depends_on = [
    #     "${aws_eks_cluster.master-node.name}"
    # ]
}
