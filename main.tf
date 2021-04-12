


provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-2"
}

resource "aws_instance" "lb" {
  ami           = "ami-0b32ec75f2cd21d30"
  instance_type = "t2.micro"
  user_data          = "${file("lb.conf")}"
  key_name = "id_rsa_msa"
}

resource "aws_instance" "web1" {
  ami           = "ami-0b32ec75f2cd21d30"
  instance_type = "t2.micro"
  user_data          = "${file("web.conf")}"
  key_name = "id_rsa_msa"
}

resource "aws_instance" "web2" {
  ami           = "ami-0b32ec75f2cd21d30"
  user_data          = "${file("web2.conf")}"
  instance_type = "t2.micro"
  key_name = "id_rsa_msa"
}

resource "aws_instance" "web3" {
  ami           = "ami-0b32ec75f2cd21d30"
  user_data          = "${file("web3.conf")}"
  instance_type = "t2.micro"
  key_name = "id_rsa_msa"
}




output "public_instance_ip1" {
  value = ["${aws_instance.web1.public_ip}"]
}
output "public_instance_ip2" {
  value = ["${aws_instance.web2.public_ip}"]
}

output "public_instance_ip3" {
  value = ["${aws_instance.web3.public_ip}"]
}

output "public_instance_ip4" {
  value = ["${aws_instance.lb.public_ip}"]
}



