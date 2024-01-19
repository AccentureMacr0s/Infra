resource "aws_instance" "example" {
  ami           = "ami-0abcdef1234567890" # Замените на ваш AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
