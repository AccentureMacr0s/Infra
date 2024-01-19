resource "aws_instance" "aws_linux_instance" {
  ami           = var.aws_linux_ami
  instance_type = "t2.micro"
  # Другие необходимые конфигурации
}

resource "aws_instance" "varbox_linux_instance" {
  ami           = var.varbox_linux_ami
  instance_type = "t2.micro"
  # Другие необходимые конфигурации
}
