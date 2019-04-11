# K8S-terraform-AWS-Ansible
Create a K8S virtual environment with Terraform and Ansible

## Requirements
  - Terraform (in my PC WIN10)
  - Ansible (I have EC2 instance with Ansible installed)
  
## Instructions
  - create with terraform vpc and 3xec2 instances: clone this repo to your PC(terrform installed) https://github.com/hezil/Ops-my_terraform_1xVPC_3xEC2.git and run infractructure and instances.
    1. befor run need to re-add .tfvars file to infrastructure and inctances folder
    2. in the instances>instances_only_pub.tf add security groups inbound rule allow TCP port 6443 forward to enable communitcation from          K8S minions to master (already part of terraform ec2 configution)
  - perfomr "sudo apt install python -y" on the instances that was created by terraform in the setp bebore(to aviod ansible playbook failure - need         install python 2.7 on minions nodes)
  - Clone the git repo to my ansible server to /etc/ansible/
  - cd /etc/ansible/K8S/K8S-terraform-AWS-Ansible-/
  - ansible-playbook -i k8s_hosts install-docker.yml 
  - ansible-playbook -i k8s_hosts k8s-common.yml
  - ansible-playbook -i k8s_hosts -l masters k8s-master.yml 
  - ansible-playbook -i k8s_hosts -l minions k8s-minion.yml
  
  - connect via ssh to k8s-master
  - kubectl get nodes
  - you should get the following output:

    master     Ready    master   19h   v1.13.0

    minion-1   Ready    <none>   18h   v1.13.0

    minion-2   Ready    <none>   18h   v1.13.0
