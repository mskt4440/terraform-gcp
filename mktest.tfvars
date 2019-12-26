# Variables
## General
project_id                  = "project"
region                      = "asia-northeast1"
## VPC
vpc_name                    = "mktest-vpc"
subnet_name                 = "mktest-node-net"
subnet_cidr                 = "10.0.0.0/18"
podnet_name                 = "mktest-pod-net"
podnet_cidr                 = "10.1.0.0/18"
servicenet_name             = "mktest-service-net"
servicenet_cidr             = "10.2.0.0/18"
flowlog_aggregation_interval = "INTERVAL_10_MIN"
router_name                 = "mktest-router"
nat_name                    = "mktest-nat"
## GKE
cluster_name                = "mktest-cluster"
authorized_name             = "local"
authorized_cidr             = "127.0.0.1/32"
nodepool_name               = "mktest-nodepool"
nodepool_machine            = "n1-standard-1"
min_node_count              = "1"
max_node_count              = "1"
