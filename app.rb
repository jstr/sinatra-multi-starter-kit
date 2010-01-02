## Require core sinatra gear
require 'sinatra/base'

## Get core helpers
require File.join(File.dirname(__FILE__), 'helpers', 'config_helper.rb')
require File.join(File.dirname(__FILE__), 'helpers', 'app_helper.rb')
require File.join(File.dirname(__FILE__), 'helpers', 'core_extensions.rb')

## Define core app functionality

module App
  
  class AppBase < Sinatra::Base
    
    include AppHelper
    include ConfigHelper
    
    set :static, true
    set :public, 'public/'
        
  end
    
end

