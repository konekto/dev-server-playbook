# An Ansible Development Server Playbook

**This branch will remove hackmd, onlyoffice and radicale as services on later stages. We use
Nextcloud integrated with OnlyOffice document server as replacement for those services**

**This branch will introduce a global services folder.


This Ansible playbook and its tasks provision a Ubuntu 16.04 LTS server as development
server for programmers. Following services will be installed:

* Gitlab http://gitlab.com
* Redmine http://www.redmine.org
* Nextcloud http://nextcloud.org
* Rocketchat http://rocket.chat

Besides those services the playbook installs some background services and tools:
 
* Docker http://docker.com
* Let's Encrypt http://letsencrypt.org

All services will use the HTTPS protocol. All certificates will be automatically created
be the *letsencrpyt* tool. 
 
You can disable Let's encrypt completely with the *enable_letsencrypt* variable. 
That is very useful for Vagrant testing.

Additionally the playbook performs a Ubuntu dist-upgrade.

## Usage

You can run the playbook with the following Ansible command:

```
ansible-playbook -i hosts install-server.yml -e @vars.yml 
```

Make sure you setup your inventory file correctly and defined all variables in the varfile. 
See the description of all variables under *Variables* section in this document

## The Tasks

All tasks are located in the tasks directory. 

* Harding-server - Performs some harding server tasks e.g. altering the sshd config
* install-docker - Installs the docker engine
* install-gitlab - Installs the Gitlab omnibus package with a custom configuration
* install-letsencrypt - Installs the letsencrypt cmd line tool
* install-nginx - Installs the nginx server. Nginx will be used as proxy server for all services
* install-redmine - Installs the a redmine instance as docker images
* install-sandstorm - Installs the sandstorm via the official install script
* ubuntu - performs a dist-upgrade and installs *useful* packages

For more details on a specific tasks look at the corresponding *main.yml* file.

## Variables

All variables are mandatory. For examples see the file *variables.yml.example*.

### Let's encrypt

* enable_letsencrypt - true or false
* letsencrypt_email - needed e-mail for the cmd line tool 

### Sshd

* sshd_port - used by the harding tasks. Defines the port number for the sshd server

### Gitlab

* gitlab_domain - the custom Gitlab domain

* gitlab_smtp_enabled - Used by a conditional check in the gitlab.rb. If true the gitlab email config block will be included.

For the description of SMTP variables see: https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template#L365

* gitlab_smtp_address
* gitlab_smtp_port
* gitlab_smtp_user_name
* gitlab_smtp_password
* gitlab_smtp_domain
* gitlab_smtp_authentication
* gitlab_smtp_enable_starttls_auto
* gitlab_smtp_tls

### Sandstorm

* sandstorm_port - internal port
* sandstorm_hostname - hostname of the instance
* sandstorm_wildcard_host - wildcard hostname of the instance
* sandstorm_dev_accounts - yes or false

### Redmine

* redmine_domain - the domain of the redmine instance
* redmine_name - part of the Docker container name
* redmine_image: "redmine:3.2.3-passenger"

## Vagrant

For testing purposes this repository contains a Vagrantfile. You can use Vagrant for
testing locally the playbook. It is especial handy if you add or change tasks.
To start the vagrant box just use:

```
vagrant up
```

The corresponding hosts entry looks something like that:

```
[vagrant]
127.0.0.1 ansible_user=ubuntu ansible_port=2222 ansible_ssh_private_key_file=.vagrant/machines/default/virtualbox/private_key
```

You can find out your vagrant ssh config with this command:

```
vagrant ssh-config
```

Don't forget to change the host in the playbook. ;)

## License 

**MIT**

Copyright 2017 Konek.to

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.