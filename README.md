rm3-docker-compose
===================

What is it?
-----------

rm3 is a system for managing stuff on the web. It's a little more than just a blog engine, but a little less than an enterprise CMS. It is to Drupal as Ghost is to WordPress. When farther along, it will be able to be used as a blog, or a wiki, or a photo archive, or a combination of things. Like a blog, it lets you create a series of blog articles in a collection. Like a wiki, it maintains a history of all changes.  Like a CMS, it lets you create a site with more structure than a mere list of posts.

Release Status
--------------

This is currently in PRE-ALPHA state, defined as:
* I'm not yet trying to run this in production, so you definitely shouldn't.
* Any data you put in here you should be prepared to reconstruct without the benefit of a migration tool.
* Security and stability bugs are to be expected.  You probably don't want this exposed on the public internet
* Key features are missing.
* The basic structure of code is assumed to be unstable and any APIs are subject to change

The next milestone is ALPHA, defined as:
* Key features are not missing
* Any data you put in here you should be prepared to reconstruct without the benefit of a migration tool.
* Security and stability bugs are to be expected.
* Some stable internal APIs will be present.

What containers are running?
----------------------------

 - `web`: a container running the httpd server, exposed as port 4000
 - `postgres`: a container running postgres, linked to web
 - `data`: A container to hold the storage volume so it persists across restarts of `postgres`

How to get started?
-------------------

- Set up
  - Build the containers: `docker-compose build`
  - Start up the stack of containers: `docker-compose start postgres`
  - Wait a few minutes for postgres to get started up.
  - Run the setup: `docker-compose run web /src/setup.sh`
  - Start everything up: `docker-compose up -d`
  - Default username is `wirehead`, password is `password`.
- Other useful operations
 - `docker-compose stop` to shut things down
 - `docker-compose run web bash` to open a bash terminal so you can run CLI.
 