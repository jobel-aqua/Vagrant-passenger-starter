# Vagrant starter config

A starter config for [Vagrant](http://www.vagrantup.com/) using [Passenger](https://www.phusionpassenger.com/) server and [Nginx](http://nginx.com/) to launch Ruby, Python and Nodejs applications.

Once you've installed Vagrant and init this repo with `vagrant up`, you can update this previous languages or directly install Passenger.

I used Ansible for **provisioning** (that is coded in Python) instead of basic shell commands, Puppet or Chef.

## Starting with ansible

Install Ansible on you machine

	sudo easy_install pip
	sudo pip install -U ansible
	
	
## Links

List of links based on the `Vagranfile` config

- <a href="http://localhost:8080/" target="_blank">localhost/</a> (express app)
- <a href="http://localhost:8080/test" target="_blank">localhost/test</a> (express app)
- <a href="http://localhost:8080/ruby" target="_blank">localhost/ruby</a>
- <a href="http://localhost:8080/python" target="_blank">localhost/python</a>
- <a href="sub.localhost/" target="_blank">sub.localhost/</a> (html)
- <a href="sub.localhost/node/" target="_blank">sub.localhost/node/</a>

NB: Subdomain are only accessibles if you've added to your `/etc/hosts` 

	2.2.2.2         sub.localhost


## Credits

- [Ansible doc](http://docs.ansible.com/index.html)
- [Vagrant doc](https://docs.vagrantup.com/v2/)
- [Gazebo wiki](http://gazebosim.org/wiki/Nginx_Passenger_Rail)
