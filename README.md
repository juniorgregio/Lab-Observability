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

Entendido! Vou incluir no README as instruções específicas para executar os arquivos do Terraform e do Ansible, destacando também a automação que inicia o Ansible após a execução do Terraform. Aqui está o trecho atualizado:

---

## Como Utilizar 🛠️

### Executando o Terraform

1. **Inicialize o Terraform:**
   - Navegue até o diretório do Terraform (`/path/to/terraform/files`).
   - Execute `terraform init` para inicializar o diretório de trabalho do Terraform.

2. **Aplicando as Configurações do Terraform:**
   - Execute `terraform apply` para aplicar as configurações.
   - Após a execução, o Terraform automaticamente inicia o processo do Ansible para configurar os servidores provisionados.

### Executando o Ansible Manualmente

Caso precise executar o Ansible manualmente (por exemplo, para reconfigurar servidores ou para fins de teste), siga estes passos:

1. **Atualize o Inventário do Ansible:**
   - Execute o script `update_ansible_hosts.sh` para garantir que o inventário esteja atualizado com os endereços IP mais recentes dos servidores provisionados.

2. **Execute o Playbook do Ansible:**
   - Navegue até o diretório do Ansible (`/path/to/ansible/files`).
   - Execute `ansible-playbook playbook_easytravel.yml` para iniciar a configuração dos servidores.

### Automação Terraform-Ansible

- Este projeto está configurado para que, após a execução bem-sucedida do Terraform (`terraform apply`), ele automaticamente inicie o Ansible. Isso é feito através de um recurso de automação no Terraform que chama o Ansible como uma etapa subsequente.

---

Lembre-se de substituir `/path/to/terraform/files` e `/path/to/ansible/files` pelos caminhos reais onde seus arquivos Terraform e Ansible estão localizados.

## Instruções Detalhadas para Configuração 📚

- **Terraform:** Atualize `main.tf` com detalhes do provedor AWS, personalizando os recursos. Execute `terraform init` e `terraform apply`.
- **Ansible:** Execute `update_ansible_hosts.sh`, personalize `playbook_easytravel.yml` e use o Ansible para configurar o ambiente EasyTravel-demo.
