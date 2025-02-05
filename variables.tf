variable "cluster_name" {
  description = "ID of the existing VPC where the EKS cluster will be deployed"
  type        = string
  default     = "eks-cluster-server"                # 'tfvars' 파일에 정의하지 않으면 default 값이 적용됨
}

variable "cluster_version" {
  description = "ID of the existing VPC where the EKS cluster will be deployed"
  type        = string   
  default     = "1.31"                               
}


variable "vpc_id" {
  description = "ID of the existing VPC where the EKS cluster will be deployed"
  type        = string

  validation {
    condition = substr(var.vpc_id, 0, 4) == "vpc-"
    error_message = "The vpc_id vaule must be a valid VPC id, starting with 'vpc-'."
  }
}

variable "private_subnet_ids" {
  description = "List of subnet IDs within the VPC for EKS to use"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "Name of the SSH key to be used for the worker nodes"
  type        = string
  default     = ""
}

variable "project" {
  description = "Name of the Project"
  type        = string               
}