# Vagrant starter

A starter config for [Vagrant](http://www.vagrantup.com/) using [Passenger](https://www.phusionpassenger.com/) server and [Nginx](http://nginx.com/) to launch Ruby, Python and Nodejs applications.

Once you've installed Vagrant and init this repo with `vagrant up`, you can update this previous languages or directly install Passenger.



## Update languages

### Python

	sudo add-apt-repository -y ppa:fkrull/deadsnakes
	sudo apt-get update
	sudo apt-get install -y python3.3

### Nodejs

	sudo add-apt-repository -y ppa:chris-lea/node.js
	sudo apt-get update
	sudo apt-get install -y nodejs

### Ruby

	sudo add-apt-repository -y ppa:brightbox/ruby-ng
	# or
	sudo add-apt-repository -y ppa:brightbox/ruby-ng-experimental
	sudo apt-get update
	sudo apt-get install -y ruby2.1 ruby2.1-dev ruby2.1-doc



## Install Passenger

According to [Passenger's tutorial](https://www.phusionpassenger.com/documentation/Users%20guide%20Standalone.html#install_on_debian_ubuntu), add the apt repository

	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
	sudo apt-get install apt-transport-https ca-certificates

Create a file `/etc/apt/sources.list.d/passenger.list` and insert one of the following lines, depending on your distribution. Only add ONE of these lines, not all of them.

	# Ubuntu 14.04
	deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main
	# Ubuntu 12.04
	deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main
	# Ubuntu 10.04
	deb https://oss-binaries.phusionpassenger.com/apt/passenger lucid main
	# Debian 7
	deb https://oss-binaries.phusionpassenger.com/apt/passenger wheezy main
	# Debian 6
	deb https://oss-binaries.phusionpassenger.com/apt/passenger squeeze main

Secure passenger.list and update your APT cache:

	sudo chown root: /etc/apt/sources.list.d/passenger.list
	sudo chmod 600 /etc/apt/sources.list.d/passenger.list
	sudo apt-get update

Install packages

	sudo apt-get install passenger

Finally install Passenger Nginx module

	sudo passenger-install-nginx-module

Follow the steps, but basic config must looks like 

	sudo passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags=none --languages ruby



## Nginx config

### Create an init script

Copy [this code](https://p.kk7.me/anuvobicah.bash) into /etc/init.d/nginx

Now, allow permissions to this file and set it to default

	sudo chmod +x /etc/init.d/nginx
	sudo /usr/sbin/update-rc.d -f nginx defaults
	sudo service nginx start

### Create server in Nginx

Open your Nginx config in `/opt/nginx/conf/nginx.conf`, delete all the content and paste this code

	worker_processes  1;

	error_log  /opt/nginx/logs/error.log;
	pid        /opt/nginx/logs/nginx.pid;

	events {
	    worker_connections  1024;
	}

	http {
	    passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
	    passenger_ruby /usr/bin/ruby2.1;

	    include       mime.types;
	    default_type  application/octet-stream;
	    sendfile        on;
	    keepalive_timeout  65;

	    server {
	        listen 80;
	        server_name localhost;

	        location / {
	            root html;
	            try_files $uri $uri/ /index.html;
	        }

	        location /ruby {
	            passenger_enabled on;
	            root /var/www/ruby/public;
	        }

	        location /node {
	            passenger_enabled on;
	            root /var/www/node/public;
	        }

	        location /python {
	            passenger_enabled on;
	            root /var/www/python/public;
	        }
	    }
	}

The url must be `http://localhost:8080`. This previous config means that you've created 4 locations : the basic one at `/`, the Ruby one at `http://localhost:8080/ruby`, the Nodejs one `http://localhost:8080/node` and the Python one `http://localhost:8080/python`. You've set the Passenger option called `passenger_enabled on;` to detect and start your app. Everytime you add a new app, Nginx also required a new location or server in some cases (new domain, new subdomain).


## Credits

- [Gazebo wiki](http://gazebosim.org/wiki/Nginx_Passenger_Rail)
- 