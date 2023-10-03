resource "aws_instance" "web" {
  ami             = "ami-0bb4c991fa89d4b9b"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.abhi23.name]
}



resource "aws_s3_bucket" "mys3abhi" {
  bucket = "mys3abhi"
  acl    = "private"
}



resource "aws_security_group" "abhi23" {
  name        = "abhi23-security-group"
  description = "Example Security Group"
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.abhi23.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.abhi23.id
  cidr_blocks       = ["0.0.0.0/0"]
}



resource "aws_security_group_rule" "https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.abhi23.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_ebs_volume" "abhi1" {
  availability_zone = "us-east-1c"
  size              = 1
}

resource "aws_volume_attachment" "abhi1" {
  device_name = "/dev/sdf"
  instance_id = "i-01373bfe865254beb"
  volume_id   = aws_ebs_volume.abhi1.id
}
