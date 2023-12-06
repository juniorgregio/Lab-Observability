# Script Python: update_ansible_hosts.py

import subprocess
import json

def get_terraform_output():
    output = subprocess.check_output(["terraform", "output", "-json"])
    return json.loads(output)['public_ip']['value']

def update_ansible_hosts(new_ip):
    ansible_hosts_file = 'hosts'  # Caminho para o arquivo hosts do Ansible
    with open(ansible_hosts_file, 'w') as file:
        file.write(f"all:\n  children:\n    terraform-ansible:\n      hosts:\n        {new_ip}\n")

if __name__ == "__main__":
    new_ip = get_terraform_output()
    update_ansible_hosts(new_ip)
