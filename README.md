## Turing Utility Scripts

This repository contains a handful of utility scripts used from time to
time at Turing. Several have to do with setting up student accounts on
heroku or Digital Ocean in an automated way.

### Contents

* `provisioner_do.rb` - Use Digital Ocean API to create a new Droplet
* `provisioner_do_servers.rb` - Uses `Provisioner::DO` to create a
  series of student droplets
* `provision_heroku_servers.rb` - Use the Heroku API and a list of
  student github repositories to create new heroku instances and deploy
  to them
* `generate_outline.rb` - Creates outline for student project evaluation
