#!/bin/bash
createdb rm3test -U wirehead -h postgres
psql rm3test -U wirehead -h postgres < db-schema.sql
./bin/rm3load -f default_frontpage.json
./bin/rm3load -f default_users.json
./bin/rm3admin adduser wirehead "Ken Wronkiewicz" -p "Some profile text" -u http://www.wirewd.com/ -e wh@wirewd.com --password password
./bin/rm3admin assign wirehead root
./bin/rm3admin permit root edit \*
./bin/rm3admin permit root delete \*
./bin/rm3admin permit root view \*
./bin/rm3admin permit root grant \*
./bin/rm3admin permit root viewdraft \*
./bin/rm3admin permit nobody view wh.!users