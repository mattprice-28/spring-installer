#!/bin/bash
# create spring user
`sudo useradd -m -s /bin/bash spring`

# install java git maven
`sudo apt install -y openjdk-8-jdk git`
`sudo apt install -y maven`

sudo cp spring.service /etc/systemd/system
