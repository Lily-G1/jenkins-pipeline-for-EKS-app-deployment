resource "null_resource" "eks_cluster_monitoring" {
    provisioner "local-exec" {
        command = "sh /eks_monitoring_provision.sh ${aws_eks_cluster.demo.id}"
    }
    # depends_on = [
    #     "${aws_eks_cluster.master-node.name}"
    # ]
}
