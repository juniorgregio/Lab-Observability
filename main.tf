terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  key_name      = "iac_estudos"

  # Opcional: Adicione o bloco root_block_device conforme necessário
  # root_block_device {
  #   volume_size = 16 # Tamanho do volume em GB
  # }

  # Opcional: Adicione user_data conforme necessário
  # user_data = <<-EOF
  #   #!/bin/bash
  #   ...
  # EOF

  tags = {
    Name = "Terraform Ansible Python"
  }

  #  # Gerar inventário dinâmico para o Ansible
  # provisioner "local-exec" {
  #   command = "echo '{\"all\": {\"hosts\": [\"${self.public_ip}\"]}}' > ansible_inventory.json"
  # }

  # Gerar inventário dinâmico para o Ansible
provisioner "local-exec" {
# Gerar inventário dinâmico para o Ansible
  command = "echo '{\"all\": {\"children\": {\"terraform_ansible\": {\"hosts\": {\"${self.public_ip}\": null}}}}}' > ansible_inventory.json"
}



 # Executar playbook do Ansible
 # Está incluído o comando "sleep 30", que faz aguardar 30 segundos antes de executar o ansible
 # Foi incluído pois a instância não estava pronta para conexão e logo em seguida o ansible tentava conectar
 # Como melhoria é necessário aplicar técnicas de verificação de saúde da instância e não sleep
provisioner "local-exec" {
  command = "sleep 30 && ansible-playbook -i ansible_inventory.json playbook_estudos.yml -u ubuntu --private-key=/mnt/c/Users/junio/OneDrive/Área\\ de\\ Trabalho/Estudos/DevOps/Projeto\\ IaC/iac_estudos.pem --ssh-extra-args='-o StrictHostKeyChecking=no' -vvvv > ansible_output.txt"
  when    = create
}
}

# # Para a destruição da instância (se necessário)
# resource "null_resource" "ansible_cleanup" {
#   depends_on = [aws_instance.app_server]

#   provisioner "local-exec" {
#     command = "ansible-playbook -i ansible_inventory.json playbook_cleanup.yml"
#     when    = destroy
#   }

# }
