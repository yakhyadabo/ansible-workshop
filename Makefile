default: up

up: 
	@vagrant up

dependencies:
	@ vagrant plugin install vagrant-hostsupdater
	@ vagrant plugin install vagrant-vbguest

install: 
	@ansible-galaxy install -r requirements.yml

update: 
	@ansible-galaxy install -r requirements.yml --force

ci-upgrade: 
	@ansible-playbook -i inventories/prod/inventory rolling_update.yml --vault-password-file ~/.vault_pass.txt -u centos
	@ansible-playbook -i inventories/prod/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt -u centos

ci: 
	@ansible-playbook -i inventories/prod/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt -u centos
	
site:
	@ansible-playbook -i inventories/prod/inventory site.yml --vault-password-file ~/.vault_pass.txt

broker: 
	@ansible-playbook -i inventories/prod/inventory playbooks/brokers.yml 
 
common: 
	@ansible-playbook -i inventories/prod/inventory playbooks/common.yml 
	
logging:
	@ansible-playbook -i inventories/prod/inventory playbooks/logging.yml 

ucd: 
	@ansible-playbook -i inventories/prod/inventory playbooks/ucd.yml 

test: 
	@ansible-playbook -i inventories/prod/inventory site.yml --syntax-check --list-tasks --vault-password-file ~/.vault_pass.txt

encrypt:
	@ansible-vault encrypt inventories/prod/group_vars/ci-server/vault.yml --vault-password-file ~/.vault_pass.txt

################################################################
################################################################

local-ci-upgrade: 
	@ansible-playbook -i inventories/local/inventory rolling_update.yml --vault-password-file ~/.vault_pass.txt -u centos
	@ansible-playbook -i inventories/local/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt -u centos

local-ci: 
	@ansible-playbook -i inventories/local/inventory playbooks/ci.yml --vault-password-file ~/.vault_pass.txt -u centos
	
local-site:
	@ansible-playbook -i inventories/local/inventory site.yml --vault-password-file ~/.vault_pass.txt

local-broker: 
	@ansible-playbook -i inventories/local/inventory playbooks/brokers.yml 
 
local-common: 
	@ansible-playbook -i inventories/local/inventory playbooks/common.yml 
	
local-logging:
	@ansible-playbook -i inventories/local/inventory playbooks/logging.yml 

local-ucd: 
	@ansible-playbook -i inventories/local/inventory playbooks/ucd.yml 

local-test: 
	@ansible-playbook -i inventories/local/inventory site.yml --syntax-check --list-tasks --vault-password-file ~/.vault_pass.txt

local-encrypt:
	@ansible-vault encrypt inventories/local/group_vars/ci-server/vault.yml --vault-password-file ~/.vault_pass.txt
