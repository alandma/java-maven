#!/bin/bash

# build app
mvn -B -f ${PWD}/pom.xml install -s /usr/share/maven/ref/settings-docker.xml dependency:resolve -DskipTests #Exemplo

mvn -B -f ${PWD}/pom.xml package -s /usr/share/maven/ref/settings-docker.xml -DskipTests #Exemplo
