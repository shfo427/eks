module "eks" {
  source          = "terraform-aws-modules/eks/aws" # 공식 EKS 모듈 경로
  version         = "~> 19.0"                       # EKS 모듈 관련, Terraform 버전을 19.x.x 버전만 사용

  cluster_name    = var.cluster_name        
  cluster_version = var.cluster_version      
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true                    
  
  # VPC #
  vpc_id           = var.vpc_id                     # 기존 VPC ID 를 참조
  subnet_ids       = var.private_subnet_ids         # 기존 private 서브넷을 참조 
 
  # EKS 관리에 필요한 IAM 역할 생성
  create_iam_role          = true
  iam_role_name            = "ServiceRole-${var.cluster_name}"      # 위 변수와 일반 문자열을 결합
  iam_role_description     = "IAM role for managing the EKS cluster"

  fargate_profiles = {
    fp-coredns = {
      name = "fp-coredns"
      selectors = [
        {
          namespace = "kube-system"
          labels = {
            k8s-app = "kube-dns"
          }
        }
      ]
    } 
  }

  # 클러스터의 애드온 추가
  cluster_addons = {
    coredns = {                         # 클러스터 내부에서 DNS 이름 해석
      resolve_conflicts = "OVERWRITE"   # 클러스터에 해당 애드온이 이미 설치되었을 경우, 기존 구성/버전 무시하고 강제 업데이트
    }
    kube-proxy = {}                     # Null인 경우, 애드온을 현재 상태로 유지 : 워커 노드와 Pod 간의 네트워크 트래픽을 처리
    vpc-cni = {                         # Pod가 CNI 플러그인으로 ENI를 통해 AWS VPC 네트워킹와 통신
      resolve_conflicts = "OVERWRITE"
    }
  }

  # 태그 
  tags = {
    cluster_name = var.cluster_name 
    Project      = var.project
  }
}