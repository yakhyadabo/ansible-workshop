default: install

install: 
	@ansible-galaxy install -r requirements.yml 
	
update: 
	@ansible-galaxy install -f -r requirements.yml 

playbook: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml 

test: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --syntax-check --list-tasks
