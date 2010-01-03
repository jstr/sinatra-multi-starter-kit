Sinatra Starter Kit
===================

A Sinatra starter kit for a multi-file web application. I use this for building basic sinatra apps.

Features
--------

* A logical directory structure for larger sinatra apps (i.e. not just one file).
* Console in ./scripts/console to play with model and lib code, ala Rails.
* Automagical loading of controllers/, lib/ and models/ files.
* DataMapper support built-in, including custom Rake tasks.

Getting Started
---------------

Open config.ru and controllers/test.rb and take a look. It should be pretty obvious how to get started.

Dependencies
------------

You will need to install the following with rubygems:

* sinatra
* dm-core
* dm-timestamps (If you want Rails-like automatic timestamping in models.)
* shotgun (For auto-reloading of application files during testing.)

Author
------

James Stradling / james@beachstone.co.nz / @jstr

