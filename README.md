# Dota Lounge

Welcome to the Dota lounge; a place to kick back, relax and enjoy some Dota 2 data.
The goal is to provide a web app that serves as a live tracker of current Dota 2 league games. 

This project will use [Valve's Steam Web API](https://developer.valvesoftware.com/wiki/Steam_Web_API) for [Dota 2](https://wiki.teamfortress.com/wiki/WebAPI).  
Running live matches and finished matches are fetched/saved into the PostgresSQL db automatically using cronjobs.

### Tech

```
Ruby version: 2.2.0
Rails version: 4.2.3
Database: PostgreSQL
Test suite: RSpec
```

Dota Lounge uses a number of open source projects to work properly (more to come):

* [Ruby on Rails] - because it's awesome!
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [jQuery] - 'nuff said!

### Installation

```sh
$ git clone https://github.com/milchschaum/dota_lounge.git
$ cd dota_lounge
$ rake db:create
$ rake db:migrate
$ rails s
```
### Todos

 - Too many to list!