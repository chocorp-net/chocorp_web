# chocorp.net

![ruby version](https://img.shields.io/badge/Ruby%20version-2.7.0-red)
![issues](https://img.shields.io/github/issues/chocorp-net/chocorp_web)
![hardware](https://img.shields.io/badge/Raspberry%20PI%204-cd2355)

## Install

1. Setup

This project relies on [tmux](https://github.com/tmux/tmux) and [rvm](https://rvm.io/)

```bash
git clone git@github.com:chocorp-net/chocorp_web.git
```
2. Ruby version and dependencies, NodeJS

`chocorp_web` uses Ruby 2.7.0, and RVM to manage depencencies. First install `ruby-2.7.0` then cd into the project. RVM should handle the rest.

```bash
rvm install ruby-2.7.0
cd chocorp_web
# RVM does its stuff
which bundle  # $HOME/.rvm/rubies/ruby-2.7.0/bin/bundle
bundle install
```

As it is a Rails 6 project, you will need to install `node` and `yarn`.


3. Rails
  1. Configuration

It will need a few configuration before we actually run it. It is going to need octoprint secrets.

```bash
cp -r private_examples private
```

  2. Development

First let's setup the database.

```bash
bin/rails db:create
bin/rails db:migrate
# If it doesn't do anything:
bin/rails db:migrate:redo
# Finally we populate the db
bin/rails db:seed
```

Ready to go!

  3. Production

Generate a new secret (make sure EDITOR is set).

```bash
rm config/credentials.yml.enc
bin/rails credentials:edit
```

Compile the assets.

```bash
bin/rails assets:precompile
```

I also had to go through all steps for setting up the database, prefixed with `RAILS_ENV=production`.

4. Launch the app

The tmux script takes a single argument. If set, it will start the web server in development mode, if empty in production mode.

`./run.sh [random]  # ezpz`
