default: install

install: 
	@ansible-galaxy install -r requirements.yml 

jenkins-upgrade: 
	@ansible-playbook -i inventories/vagrant/inventory rolling_update.yml
	@ansible-playbook -i inventories/vagrant/inventory ci.yml --vault-password-file ~/.vault_pass.txt

site:
	@ansible-playbook -i inventories/vagrant/inventory site.yml --vault-password-file ~/.vault_pass.txt

broker: 
	@ansible-playbook -i inventories/vagrant/inventory brokers.yml --vault-password-file ~/.vault_pass.txt
 
docker: 
	@ansible-playbook -i inventories/vagrant/inventory docker.yml --vault-password-file ~/.vault_pass.txt
	
ci: 
	@ansible-playbook -i inventories/vagrant/inventory ci.yml --vault-password-file ~/.vault_pass.txt
	
test: 
	@ansible-playbook -i inventories/vagrant/inventory site.yml --syntax-check --list-tasks --vault-password-file ~/.vault_pass.txt

encrypt:
	@ansible-vault encrypt playbooks/ci/vars/vault.yml --vault-password-file ~/.vault_pass.txt
