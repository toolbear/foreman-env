foreman-env
===========

Loads a [Foreman-style](http://ddollar.github.com/foreman/#ENVIRONMENT) environment file. To automagically load `.env` files into `ENV` use [dotenv](https://github.com/bkeepers/dotenv).


Installation
------------

Add this line to your application `Gemfile`

    gem 'foreman-env'

Usage
-----

    require 'foreman/env'
    
    def foo filename
      env = {}
      Foreman::Env.new(filename).entries do |name, value|
        env[name] = value
      end
      env
    end

The file should contain key/value pairs, separated by =, with one key/value pair per line.

    FOO=bar
    BAZ=qux

See [Foreman](https://github.com/ddollar/foreman) for more info.

License
-------

MIT