rm3-docker-compose
===================

What is it?
-----------

rm3 is not just a blog engine, but it's still lighter-weight and friendlier than those enterprise-grade CMS systems.  Conceptually, it is to Drupal as Ghost is to WordPress.

rm3 is able work as a blog, a wiki, a photo archive, or some combination of those... and more.

rm3 has blog-styled views such that you can post a series of dated blog articles and view them as such.  But every entity on the site has a history, like how a wiki works.  Like some of those enterprise CMS systems, you aren't restricted to just creating a mere list of posts.

rm3 has rapidly improving support for media:  It supports photos, but it also supports SVG vector graphics and audio files.  

Release Status
--------------

This is currently in ALPHA state, defined as:
* I'm running it in production
* Key features are not missing
* Any data you put in here you should be prepared to reconstruct without the benefit of a migration tool (but I'm going to try very hard to avoid that)
* Security and stability bugs are to be expected.
* Some stable internal APIs will be present.

The next milestone is BETA, defined as:
* Key features are not missing
* Any data you put in here should be able to be migrated with an offline migration where you need to shut down the site momentarily
* Stability bugs are to be expected.
* Stable APIs will be present.


What containers are running?
----------------------------

 - `web`: a container running the httpd server, exposed as port 4000
 - `redis`: a container running the redis cache, linked to web as `redis`
 - `postgres`: a container running postgres, linked to web as `postgres`
 - `data`: A container to hold the storage volume so it persists across restarts of `postgres`
 - `blobs`: A container to hold the storage volume for blobs so it persists across restarts of `web`

How to get started?
-------------------

- Set up
  - Start up the stack of containers: `docker-compose start postgres`
  - Wait a few minutes for postgres to get started up.
  - Run the setup: `docker-compose run web /src/setup.sh`
  - Start everything up: `docker-compose up -d`
  - Default username is `wirehead`, password is `password`.
- Other useful operations
 - `docker-compose stop` to shut things down
 - `docker-compose run web bash` to open a bash terminal so you can run CLI.
 - You may want to set `RM3_DANGER_DISABLE_HTTPS_CHECKS` to true for testing to disable the HTTPS login check.
 - Alternatively, you may want to set up a proxy and use `RM3_DANGER_TRUST_PROXY` to trust the proxy and provide HTTPS.
 