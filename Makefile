default: up

up: 
	@vagrant up

dependencies:
	@ vagrant plugin install vagrant-hostsupdater
	@ vagrant plugin install vagrant-vbguest

install: 
	@ansible-galaxy install -r requirements.yml 

ci-upgrade: 
	@ansible-playbook -i inventories/local/inventory rolling_update.yml --vault-password-file ~/.vault_pass.txt
	@ansible-playbook -i inventories/local/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt

ci: 
	@ansible-playbook -i inventories/local/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt
	
site:
	@ansible-playbook -i inventories/local/inventory site.yml --vault-password-file ~/.vault_pass.txt

broker: 
	@ansible-playbook -i inventories/local/inventory playbooks/brokers.yml 
 
common: 
	@ansible-playbook -i inventories/local/inventory playbooks/common.yml 
	
logging:
	@ansible-playbook -i inventories/local/inventory playbooks/logging.yml 

ucd: 
	@ansible-playbook -i inventories/local/inventory playbooks/ucd.yml 

test: 
	@ansible-playbook -i inventories/local/inventory site.yml --syntax-check --list-tasks --vault-password-file ~/.vault_pass.txt

encrypt:
	@ansible-vault encrypt inventories/local/group_vars/ci-server/vault.yml --vault-password-file ~/.vault_pass.txt
