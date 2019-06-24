# Holiday Ideas Planner

## Requirements

Docker and Docker Compose

## Installation

```
$ docker-compose build
$ docker-compose up -d
```

### Trouble Shooting
Run docker-compose up without the -d flag to see build steps:

```
$ docker-compose up
```

## Running for development

```
$ docker-compose exec holidays mix phx.server
```

Visit [http://localhost:4000](http://localhost:4000)

## Setting up Heroku
Create a new app on Heroku
* under addons, add a postgres DB
* under settings, add the following buildpacks (make sure they are in this order)
  * https://github.com/HashNuke/heroku-buildpack-elixir.git
  * https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
* under settings, add the followig config variables
  * SECRET_KEY_BASE - set this to a unique 64 character string - it is used to sign cookies
  * APP_NAME - set this to show an instance name on the CMS - defaults to "Holiday Planning Tool"


## Deploying to Heroku
add heroku as a git remote
```
$ heroku git:remote -a <heroku_app_name>
```

Deploying the first time
```
$ git subtree push --prefix holidays heroku master
```

Deploying subsequently (this allows force pushes and pushing from branches other than master)
```
$ git push heroku `git subtree split --prefix holidays master`:master
```

You can run migrations and other mix tasks like this:

```
$ heroku run "POOL_SIZE=2 mix ecto.migrate"
```
