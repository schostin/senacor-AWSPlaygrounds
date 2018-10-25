# 24h Sprint Senacor AWS Playgrounds

[![Build Status](https://travis-ci.org/sebastianneb/AWSPlaygrounds.svg?branch=master)](https://travis-ci.org/sebastianneb/AWSPlaygrounds)

Dieses Repo enthält alle Dateien / Scripts / etc. die während des 24h Sprints von Senacor am 25.10.2018 entstanden sind. Da ich
keine bius wenig Erfahrungen mit Terraform / AWS (Lamda, API Gateway, DynamoDb, Roles, etc) habe, wollte ich von null eine simple
Lambda Landschaft erstellen die via terraform jederzeit neu hochgefahren bzw. zerstört werden kann.

## Infrastructure

### Travis & Github

Ich benutze TravisCI zum bauen und deployen meiner Infrastruktur. Vorteil hiervon ist, dass Travis CI eine nahtlose Verbindung zu Github hat
und für OpenSource und private Projects umsonst nutzbar ist. Die Pipeline Definition für die Infrastruktur ist in der Datei [.travis.yml](.travis.yml)

### Terraform

## Code

### Overview

### Lambda

### DynamoDb

### API Gateway