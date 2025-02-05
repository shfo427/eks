terraform {
  required_version = ">= 1.3.3"     # Terraform 버전
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"        # AWS Provider 버전
    }
  }
}

provider "aws" {
  region = "us-west-2"          # 원하는 AWS 리전으로 변경
  profile = "default"           # AWS CLI 프로파일 설정
}