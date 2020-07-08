# reference: https://www.terraform.io/docs/providers/alicloud/r/security_group.html 
resource "alicloud_security_group" "security_group_transversal" {
    name                            = var.security_group_transversal_name
    vpc_id                          = alicloud_vpc.transversal_vpc.id
}

# reference: https://www.terraform.io/docs/providers/alicloud/r/security_group_rule.html
resource "alicloud_security_group_rule" "allow_all_tcp_transversal" {
    type                            = "ingress"
    ip_protocol                     = "tcp"
    nic_type                        = "intranet"
    policy                          = "accept"
    port_range                      = "1/65535"
    priority                        = 1
    security_group_id               = alicloud_security_group.security_group_transversal.id
    cidr_ip                         = "0.0.0.0/0"
}
