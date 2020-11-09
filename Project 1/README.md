# ELK Stack
This repository offers code and some examples for a Azure based Red/Blue Team Cybersecurity Lab c/w DVWA's and ELK Stack for IDS.
The main purpose of the project was to create cloud network with security controls and a load balanced and monitored instances of Damn Vulnerable Web Applications. 

This repository was created as part of my cybersecurity course at UWA. 

### Build

This lab was built on Azure Cloud with Linux Hosts using Docker, Ansible and apporpriate containers.

This ELK server is configured to monitor the following machines:

* Web-1 (10.0.0.5)
* Web-2 (10.0.0.6)
* Web-3 (10.0.0.7)

Monitoring collected using Filebeat and Metriceat

* Filebeat collects log files, such as SSH logins and sudo commands, for Linux/Unix based servers, which can be used to monitor for suspicious/unauthorised behaviour.
    
* Metricbeat collects system metrics such as cpu and memory usage, which can be used to monitor the performance and health of your servers.


#### How to use?

The ansible folder of this repository contains files which can be used to generate a live deployment on Azure. They can be used to either recreate the entire deployment pictured below. Alternatively, select portions of the main.yml file may be used to install only certain pieces of it, such as Filebeat.

## Network Topology

![Network Diagram](https://github.com/tehtw/UWA/blob/main/Project%201/images/Networkagram.png)

#### Network Configuration

|    Name     | Function | Protocol | Operating System| 
|:-----------:|:--------:|:--------:|:---------------:|
| JumpHost    | Gateway  | 10.0.0.4	|  Ubuntu 18.04  	|
|  Web-1      | Webserver| 10.0.0.5	|  Ubuntu 18.04  	|
|  Web-2      | Webserver| 10.0.0.6 |  Ubuntu 18.04  	|
|  Web-3      | Webserver| 10.0.0.7 |  Ubuntu 18.04  	|   
| elk-RedTeam | ELK Stack| 10.1.0.4 |  Ubuntu 18.04  	|

#### Access Policies

|    Name     | Publicly Accessible |    Allowed IP   | 
|:-----------:|:-------------------:|:---------------:|
| JumpHost    | Yes                 | Admin public IP	|
|  Web-1      | No                  | 10.0.0.4	      |
|  Web-2      | No                  | 10.0.0.4        |
|  Web-3      | No                  | 10.0.0.4        |  
| elk-RedTeam | No                  | 10.1.0.4        |

## Installation

These instructions assume that you have a similar network topology to the above and your JumpHost/Control Node is already configured with Ansible.

* SSH into your jumphost or control node (10.0.0.4)

* Navigate to /etc/

* Copy and paste ansible folder from repository to /etc/

* Update the hosts file to include all your VM's(Line 21 to line 28)
~~~
21 [webservers]
22 dvwa@10.0.0.5 ansible_python_interpreter=/usr/bin/python3
23 dvwa@10.0.0.6 ansible_python_interpreter=/usr/bin/python3
24 dvwa@10.0.0.7 ansible_python_interpreter=/usr/bin/python3
25
26 [elk]
27 elk@10.1.0.4 ansible_python_interpreter=/usr/bin/python3
28
~~~

* Update the filebeat-config.yml - Change IP address of the ELK virtual machine. (Line 1105 & 1804)
~~~
1105  hosts: ["10.1.0.4:9200"]
1106  username: "elastic"
1107  password: "changeme" # TODO: Change this to the password you set

1804 setup.kibana:
1805  host: "10.1.0.4:5601" # TODO: Change this to the IP address of your ELK server
~~~

* Update the metricbeat-config.yml - Change IP address of the ELK virtual machine. (Line 61 & 93)
~~~
61  setup.kibana:
62  host: "10.1.0.4:5601"

93 output.elasticsearch:
94  # Array of hosts to connect to.
95  hosts: ["10.1.0.4:9200"]
96  username: "elastic"
97  password: "changeme"
~~~


* Run the main.yml playbook

~~~
ansible-playbook install.yml
~~~


* Navigate to the elk vm using its public ip on port 6051 -  ELK-PUBLIC-IP:6051

