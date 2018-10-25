# 24h Sprint Senacor AWS Playgrounds

[![Build Status](https://travis-ci.org/sebastianneb/AWSPlaygrounds.svg?branch=master)](https://travis-ci.org/sebastianneb/AWSPlaygrounds)

Dieses Repo enthält alle Dateien / Scripts / etc. die während des 24h Sprints von Senacor am 25.10.2018 entstanden sind. Da ich
keine bius wenig Erfahrungen mit Terraform / AWS (Lamda, API Gateway, DynamoDb, Roles, etc) habe, wollte ich von null eine simple
Lambda Landschaft erstellen die via terraform jederzeit neu hochgefahren bzw. zerstört werden kann.

## Infrastructure

Voraussetzung für das erfolgreiche anlegen ist, dass travis für terraform secrets gesetzt hat. Die secrets können über die Commandline mit
`travis encrypt TF_VAR_access_key=<<SuperAccessKey>> --add env.gobal -p` und `travis encrypt TF_VAR_secret_key=<<SuperSecretKey>> --add env.gobal -p`.
Es empfiehlt sich natürlich, einen extra user für travis_ci in aws anzulegen und diesem nur die benötigten Rechte zu geben.

### Travis & Github

Ich benutze TravisCI zum bauen und deployen meiner Infrastruktur. Vorteil hiervon ist, dass Travis CI eine nahtlose Verbindung zu Github hat
und für OpenSource und private Projects umsonst nutzbar ist. Die Pipeline Definition für die Infrastruktur ist in der Datei [.travis.yml](.travis.yml).
Travis CI ist in der Lage die terraform scripts auszuführen und anzulegen.

### Terraform

## Code

### Overview

### Lambda

### DynamoDb

### API Gateway