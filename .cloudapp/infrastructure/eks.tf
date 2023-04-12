# 声明容器集群承载计算资源（如工作负载 StatefulSet、服务 Service 等）

resource "tencentcloud_eks_cluster" "eks" {
  availability_zone = var.app_target.subnet.zone
  k8s_version       = "1.20.6"
  vpc_id            = var.app_target.vpc.id
  subnet_ids        = [var.app_target.subnet.id]
  service_subnet_id = var.app_target.subnet.id
}

