# Variables
## General
variable "project_id" {}
variable "region" {
  default = "asia-northeast1"
}
## VPC
variable "vpc_name" {}
variable "subnet_name" {}
variable "subnet_cidr" {}
variable "podnet_name" {}
variable "podnet_cidr" {}
variable "servicenet_name" {}
variable "servicenet_cidr" {}
### flow log
variable "flowlog_aggregation_interval" {
  default = "INTERVAL_5_SEC"
}
variable "flowlog_sampling" {
  default = "0.5"
}
variable "router_name" {}
variable "nat_name" {}
## GKE
variable "cluster_name" {
  default = "cluster"
}
variable "authorized_name" {}
variable "authorized_cidr" {}
variable "nodepool_name" {
  default = "nodepool"
}
variable "nodepool_machine" {
  default = "n1-standard-1"
}
variable "min_node_count" {
  default = "1"
}
variable "max_node_count" {
  default = "1"
}
