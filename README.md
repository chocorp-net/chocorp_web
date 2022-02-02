# chocorp.net

![ruby version](https://img.shields.io/badge/Ruby%20version-2.7.0-red)
![issues](https://img.shields.io/github/issues/chocorp-net/chocorp_web)
![hardware](https://img.shields.io/badge/Running on-Raspberry%20PI%204-green)

## Install

1. Clone

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

It will need a few configuration before we actually run it. It is going to need octoprint secrets. I also put my certificates here.

```bash
cp -r private_examples private
# Edit the path of your certificates
vim start_prod.sh
```

  2. Development

First let's setup the database.

```bash
bin/rails db:create
bun/rails db:migrate
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

Good to go!
