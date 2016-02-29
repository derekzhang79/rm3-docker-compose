FROM node:0.12

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.4' > /etc/apt/sources.list.d/pgdg.list

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

RUN apt-get update && apt-get install -y postgresql-client-9.4

RUN apt-get -y install librsvg2-dev postgresql-client-9.4 libpq5 libpq-dev

RUN echo 'postgres:5432:*:wirehead:rm3test' > ~/.pgpass
RUN chmod 0600 ~/.pgpass

RUN npm install gulp -g

