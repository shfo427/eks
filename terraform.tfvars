cluster_name    = "eks-cluster-server2025"
cluster_version = "1.31"                                            # 원하는 Kubernetes 버전
vpc_id     = "vpc-086fd11d"                                         # 해당 환경의 vpc ID로 치환!!!
private_subnet_ids = ["subnet-0c9c0", "subnet-02e38b45"]            # 해당 환경의 private 서브넷 ID로 치환!!!
ssh_key_name = "server-key-pair-linux"                              # 사전에 생성한, Worker Node용 EC2 instance에 할당될 pem key
project = "2025"