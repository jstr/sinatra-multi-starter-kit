require 'rubygems'
require File.join(File.dirname(__FILE__), '..', 'helpers', 'config_helper.rb')

include ConfigHelper

## Instantiate a DataMapper interface to MySQL
require 'dm-core'
require 'dm-timestamps'
DataMapper.setup(:default, 'mysql://localhost/sinatra-starter-kit')

## Load application files
load_files_in('lib')
load_files_in('models')
