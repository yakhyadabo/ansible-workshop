default: install

install: 
	@ansible-galaxy install -r requirements.yml 

reinstall:
	@ansible-galaxy install -f -r requirements.yml 
	
jenkins-upgrade: 
	@ansible-playbook -i inventories/vagrant/inventory rolling_update.yml
	@ansible-playbook -i inventories/vagrant/inventory configure.yml 

playbook: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml 

test: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --syntax-check --list-tasks
