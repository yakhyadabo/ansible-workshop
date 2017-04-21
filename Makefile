default: init

install: 
	@ansible-galaxy install -r requirements.yml 
	
# --roles-path roles

playbook: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml 

test: 
	@ansible-playbook -i inventories/vagrant/inventory configure.yml --syntax-check

init:
	@vagrant up

update:
	@vagrant reload

provision:
	@vagrant provision

status:
	@vagrant status

stop:
	@vagrant halt

kill:
	@vagrant destroy -f
