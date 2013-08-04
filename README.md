Obtvse 2
================

A clean and simple markdown blogging platform on Rails.

**[Demo](http://obtvse2.herokuapp.com) | [Demo Admin](http://obtvse2.herokuapp.com/admin)**

Username: username@example.com

Password: password


Whats New
=========

Obtvse 2 was rewritten entirely with a focus on being more user friendly, quicker, modern, and customizable.

**Features**
- Two new themes
- Easy addition of new themes and color schemes
- Built in user system with sorcery
- Support for Typekit fonts
- Turbolinks

**New Admin**
- New interface
- Live filter posts
- Post stats
- Split screen preview markdown that follows scroll position
- Full keyboard shortcut support

**Backend features**
- Slim templating
- Kramdown for markdown
- Coderay for syntax highlighting
- Bugfixes all over (still needs many more!)


Migrating
========

Obtvse 2 is compatable with obtvse's original database structure and migrations.  Migration is as easy as cloning this repo, pointing to your old database and running migrations.

TODO
====

Obtvse needs post history saving so you can mark versions of a post.  This would also allow for editing live posts without them updating live.


Installation
============

If you are new to Rails development, check out guides for getting your development environment set up for [Mac](http://astonj.com/tech/setting-up-a-ruby-dev-enviroment-on-lion/) and [Windows](http://jelaniharris.com/2011/installing-ruby-on-rails-3-in-windows/).

    cd ~/Sites
    git clone git://github.com/natew/obtvse2.git
    cd obtvse2
    bundle install
    rake db:migrate

Edit `config/info.yml` to fill in your personal and site information.

Start the local server:

    bundle exec rails s

Go to [0.0.0.0:3000](http://0.0.0.0:3000/), to administrate you go to [/admin](http://0.0.0.0:3000/admin)
