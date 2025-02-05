## 프로비저닝한 결과에 대한 출력 값을 정의 ##

output "eks_cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API server endpoint"
  value       = module.eks.cluster_endpoint
}

output "fargate_profile_coredns" {
  description = "Fargate Profile Name for CoreDNS"
  value       = module.eks.fargate_profiles
}