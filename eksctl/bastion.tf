module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "bastion"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0e1f86e2a2f5e55fb"]
  subnet_id = "subnet-09068423ffac2f567"
  ami = data.aws_ami.ami_info.id
  user_data = file("workstation.sh")
  tags = {
    Name = "bastion"
  }

}