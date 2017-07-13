default: install

install: 
	@ansible-galaxy install -r requirements.yml 

jenkins-upgrade: 
	@ansible-playbook -i inventories/vagrant/inventory rolling_update.yml
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --vault-password-file ~/.vault_pass.txt

playbook: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --vault-password-file ~/.vault_pass.txt
 
test: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --syntax-check --list-tasks

encrypt:
	@ansible-vault encrypt playbooks/ci/vars/vault.yml --vault-password-file ~/.vault_pass.txt
