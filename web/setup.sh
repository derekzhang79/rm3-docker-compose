#!/bin/bash
createdb rm3test -U wirehead -h postgres
psql rm3test -U wirehead -h postgres < /src/node_modules/rm3/db-schema.sql
/src/node_modules/.bin/rm3load -f /src/node_modules/rm3/default_frontpage.json
/src/node_modules/.bin/rm3load -f /src/node_modules/rm3/default_users.json
/src/node_modules/.bin/rm3admin loadtemplate /src/node_modules/rm3/meta.json wh
/src/node_modules/.bin/rm3admin adduser wirehead "Ken Wronkiewicz" -p "Some profile text" -u http://www.wirewd.com/ -e nobody@wirewd.com --password password
/src/node_modules/.bin/rm3admin assign wirehead root
/src/node_modules/.bin/rm3admin permit root edit \*
/src/node_modules/.bin/rm3admin permit root delete \*
/src/node_modules/.bin/rm3admin permit root view \*
/src/node_modules/.bin/rm3admin permit root grant \*
/src/node_modules/.bin/rm3admin permit root viewdraft \*
/src/node_modules/.bin/rm3admin permit root comment \*
/src/node_modules/.bin/rm3admin permit nobody view wh.!users.\*
