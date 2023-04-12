# 声明 Hello World 应用包所暴露的应用接口，以及其对应的接口网关和接口后端

resource "cloudapp_tke_service" "api_service" {
  # 接口后端使用在 Helm Chart 中已经声明的 TKE Service
  resource_manager = "helm"
  chart_config = {
    cluster_id   = tencentcloud_eks_cluster.eks.id
    chart_id     = cloudapp_helm_app.helm_charts.id
    service_name = "hello-service"
  }
}

resource "cloudapp_api_handler" "api_gateway" {
  # 接口网关，使用上面声明的接口后端
  vpc_id           = var.app_target.vpc.id
  host             = cloudapp_tke_service.api_service.host
  handler_protocol = "http"
  handler_path     = "/api/:api_name"
}

resource "cloudapp_api" "Hello" {
  # 声明 Hello 接口，使用上面声明的接口网关
  api_name   = "Hello"
  api_desc   = "获取服务器 Hello 消息"
  handler_id = cloudapp_api_handler.api_gateway.id
}
