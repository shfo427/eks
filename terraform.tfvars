cluster_name    = "eks-cluster-server2025"
cluster_version = "1.31"                                            # 원하는 Kubernetes 버전
vpc_id     = "vpc-086fd11d0a408bd70"
private_subnet_ids = ["subnet-0c9c00c63ba3f84d2", "subnet-02e38b45757d4fa00"]  # 기존 VPC의 private 서브넷 ID(반드시 NAT GW와 연결)
ssh_key_name = "server-key-pair-linux"                                         # 사전에 생성한, Worker Node용 EC2 instance에 할당될 pem key
project = "2025"