source "amazon-ebs" "ubuntu" {
  ami_name      = "learn-packer-aws-nginx"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "echo Installing Nginx",
      "sleep 10",
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}