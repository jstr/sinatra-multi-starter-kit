# Inspired by http://github.com/tannerburson/multi-sinatra-sample/blob/master/config.ru
require 'rubygems'
require File.join(File.dirname(__FILE__), 'helpers', 'config_helper.rb')

class Rack::Builder
  include ConfigHelper
end
  
## Connect to MySQL database via DataMapper.
require 'dm-core'
require 'dm-timestamps'
DataMapper.setup(:default, 'mysql://localhost/sinatra-starter-kit')

## Load the main application class.
require File.join(File.dirname(__FILE__), 'app.rb')

## Load application files
load_files_in('lib')
load_files_in('models')
load_files_in('controllers')

## Set controller environemnts to development mode.
## Remove to when running on a production system.
[App::Main, App::Test].each do |controller|
	controller.set :environment, :development
end

## Define application routes here.

map "/test" do
  run App::Test
end

map "/" do
  run App::Main
end

