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


#### Digital Ocean Provisioner

Reads droplet names from command line args, so you can provide them
when running the script like so:

`ruby provision_do_servers.rb student-one student-two`

It should generate some output like so:

```
worace @ Guinevere / utility-scripts / master ➸  ruby provision_do_servers.rb kyra-steenbock mac-mccarthy dj-greenfield jeffrey-gu
Provisioned kyra-steenbock: #<RecursiveOpenStruct status="OK", droplet={"id"=>5720571, "name"=>"kyra-steenbock", "image_id"=>11836690, "size_id"=>64, "event_id"=>53473429}>
Provisioned mac-mccarthy: #<RecursiveOpenStruct status="OK", droplet={"id"=>5720573, "name"=>"mac-mccarthy", "image_id"=>11836690, "size_id"=>64, "event_id"=>53473434}>
Provisioned dj-greenfield: #<RecursiveOpenStruct status="OK", droplet={"id"=>5720575, "name"=>"dj-greenfield", "image_id"=>11836690, "size_id"=>64, "event_id"=>53473437}>
Provisioned jeffrey-gu: #<RecursiveOpenStruct status="OK", droplet={"id"=>5720576, "name"=>"jeffrey-gu", "image_id"=>11836690, "size_id"=>64, "event_id"=>53473438}>
```
