default: install

infra: 
	@vagrant up

install: 
	@ansible-galaxy install -r requirements.yml 

jenkins-upgrade: 
	@ansible-playbook -i inventories/vagrant/inventory rolling_update.yml
	@ansible-playbook -i inventories/vagrant/inventory ci.yml --vault-password-file ~/.vault_pass.txt

site:
	@ansible-playbook -i inventories/vagrant/inventory site.yml --vault-password-file ~/.vault_pass.txt

broker: 
	@ansible-playbook -i inventories/vagrant/inventory playbooks/brokers.yml --vault-password-file ~/.vault_pass.txt
 
common: 
	@ansible-playbook -i inventories/vagrant/inventory playbooks/common.yml --vault-password-file ~/.vault_pass.txt
	
ci: 
	@ansible-playbook -i inventories/vagrant/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt
	
logging:
	@ansible-playbook -i inventories/vagrant/inventory playbooks/logging.yml --vault-password-file ~/.vault_pass.txt

ucd: 
	@ansible-playbook -i inventories/vagrant/inventory playbooks/ucd.yml --vault-password-file ~/.vault_pass.txt

test: 
	@ansible-playbook -i inventories/vagrant/inventory site.yml --syntax-check --list-tasks --vault-password-file ~/.vault_pass.txt

encrypt:
	@ansible-vault encrypt playbooks/ci/vars/vault.yml --vault-password-file ~/.vault_pass.txt
