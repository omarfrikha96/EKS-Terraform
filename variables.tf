# Variables for the EKS cluster module
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "name" {
  description = "EKS cluster name"
  type        = string
  default     = "tes-dev-eks-cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b"]
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "intra_subnets" {
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "env" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "eks_cluster_version" {
  default = "1.29"
}

variable "vpc_cni_version" {
  default = "v1.14.1-eksbuild.1"
}

variable "coredns_version" {
  default = "v1.10.1-eksbuild.1"
}
