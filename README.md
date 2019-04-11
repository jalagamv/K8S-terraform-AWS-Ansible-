# K8S-Vagrant-Ansible
Create a K8S virtual environment with Terraform and Ansible

## Requirements
  - Terraform (in my PC WIN10)
  - Ansible (I have EC2 instance with Ansible installed)
  
## Instructions
  - create with terraform vpc and 3xec2 instances - run "Ops-my_terraform_1xVPC_3xEC2" dirctroy in this repo (befor run need to re-add       .tfvars file to infrastructure and inctances folder)
  - sudo apt install python -y on the instances was created by terraform in the setp bebore(to aviod ansible playbook failure - need         install python 2.7 on minions nodes)
  - Clone the git repo to my ansible server to /etc/ansible/
  - cd /etc/ansible/K8S/K8S-Vagrant-Ansible-/
  - ansible-playbook -i k8s_hosts install-docker.yml 
  - ansible-playbook -i k8s_hosts k8s-common.yml
  - ansible-playbook -i k8s_hosts -l masters k8s-master.yml 
  - ansible-playbook -i k8s_hosts -l minions k8s-minion.yml
  
  - connect to via ssh k8s-master
  - kubectl get nodes
  - you should get the following output:

    master     Ready    master   19h   v1.13.0

    minion-1   Ready    <none>   18h   v1.13.0

    minion-2   Ready    <none>   18h   v1.13.0
