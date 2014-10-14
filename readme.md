# Leagalytics
Analytics for League of Legends to make players play good

## Setup

run `vagrant up`

### MongoDB

MongoDB is running as a service called mongod, so to start and stop run

    sudo service mongod start/stop

The MongoDB cli client is run with `mongo`


### Redis

Redis runs as a service called redis-server, so to start and stop run

    sudo service redis-server start/stop

The Redis cli client is run with `redis-client`

### Bower

JS dependencies are managed with bower. They are currently installed straight into the `public/js/lib` directory, though I'm not sure sticking with this is good due to all the bloat the comes with some libs and their separate directory structures but it will do for now...

But yeah, run `bower install`

### NPM

NPM as usual for gulp pipeline stuff, so run `npm install`

## Gulp Commands

### make-coffee

Run this to compile coffeescript files found under the `public/js/src` directory, and place them in `public/js/dist`