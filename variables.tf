
resource "aws_security_group" "FESG" {
  
  name = "fesgtf"
  ingress{
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"  
  }
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow http"
    from_port = 0
    to_port = 80
    protocol = "tcp"
  } 
  egress{
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "permit all"
    from_port = 0
    to_port = 0
    protocol = "-1"
  } 
  
}

resource "aws_instance" "wordpressfrontend" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  key_name = "shellws"
  security_groups = [ "fesgtf" ]
  tags = {
    app = "wordpress"
    role = "frontend"
  }
}
resource "aws_eip" "wpip" {
  instance = aws_instance.wordpressfrontend.id
  vpc      = true
  tags = {
    app = "wordpress"
  }
}

resource "aws_db_instance" "wordpressbackend" {
  
  instance_class = "db.t3.micro"
  engine = "mysql"
  publicly_accessible = false
  allocated_storage = 20
  name = "wordpress"
  username = "admin"
  password = var.dbpassword
  skip_final_snapshot  = true
  tags = {
    app = "mysql"
  }

  
}