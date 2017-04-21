default: init

install: 
	@ansible-galaxy install -r requirements.yml 
	
playbook: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml 

test: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --syntax-check
