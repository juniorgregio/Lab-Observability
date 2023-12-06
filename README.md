# Projeto de Infraestrutura como Código (IaC) com Ansible e Terraform para AWS e EasyTravel 🚀

Este repositório contém arquivos para automatizar o provisionamento de máquinas na AWS e a instalação do EasyTravel-demo, um site de demonstração que simula atividades de usuários e gera falhas. Esse ambiente é ideal para instalar ferramentas de observabilidade e desenvolver técnicas e habilidades em monitoramento e gerenciamento de sistemas.

## Objetivo Principal 🎯

- **Automatizar o Provisionamento na AWS:** Usar Terraform para criar e gerenciar infraestrutura na AWS de forma eficiente.
- **Instalar o EasyTravel-Demo:** Utilizar Ansible para automatizar a instalação do EasyTravel-demo nos servidores provisionados. EasyTravel é um aplicativo de demonstração útil para simular tráfego de usuários e falhas, facilitando a prática e o desenvolvimento de habilidades em observabilidade e monitoramento de sistemas.

## Arquivos Incluídos 📁

### Terraform

- `main.tf`, `outputs.tf`, `terraform.tfstate`/`terraform.tfstate.backup`: Gerenciam a infraestrutura na AWS. **Atualize as configurações** conforme necessário.

### Ansible

- `ansible_inventory.json`, `update_ansible_hosts.sh`, `playbook_easytravel.yml`: Automatizam a configuração dos servidores AWS e a instalação do EasyTravel-demo.

### Outros

- `hosts.yml`, `iac_estudos.pem`: Suportam a configuração do Ansible e o acesso seguro aos servidores.

## Como Utilizar 🛠️

1. **Terraform:** Instale, configure e execute para provisionar infraestrutura na AWS.
2. **Ansible:** Instale, atualize o inventário e execute o playbook para configurar os servidores e instalar o EasyTravel-demo.

## Instruções Detalhadas para Configuração 📚

- **Terraform:** Atualize `main.tf` com detalhes do provedor AWS, personalizando os recursos. Execute `terraform init` e `terraform apply`.
- **Ansible:** Execute `update_ansible_hosts.sh`, personalize `playbook_easytravel.yml` e use o Ansible para configurar o ambiente EasyTravel-demo.
