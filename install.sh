!/bin/bash
#####################
# Jenkins Install

# install java and git
sudo apt install -y openjdk-8-jre openjdk-8-jdk git
# install maven
sudo apt install -y maven
# check if a jenkins user already exists
if ! cat /etc/passwd | grep jenkins; then
	# add the jenkins user
	sudo useradd -m -s /bin/bash jenkins
fi
# check if the sudoers file has jenkins in it already
if ! sudo cat /etc/sudoers | grep jenkins; then 
	# make jenkins a sudo user
	echo 'jenkins ALL=(ALL:ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
fi
# download the latest jenkins.war to the jenkins home folder
sudo wget https://updates.jenkins-ci.org/latest/jenkins.war -O /home/jenkins/jenkins.war
# make sure jenkins owns the jenkins.war file
sudo chown jenkins:jenkins /home/jenkins/jenkins.war
# install the jenkins service script
sudo cp jenkins.service /etc/systemd/system/jenkins.service
# reload all of the systemd service scripts
sudo systemctl daemon-reload
# start the jenkins service
sudo systemctl restart jenkins

#####################
# Spring Install

# create a spring user
# - make sure the user has a home folder (-m)
# - set the default shell to bash (-s)
# 	this is because sh isn't as easy use as bash
sudo useradd -m -s /bin/bash spring
# install the service script
sudo cp spring.service /etc/systemd/system/spring.service
# reload all of the systemd service scripts
sudo systemctl daemon-reload

