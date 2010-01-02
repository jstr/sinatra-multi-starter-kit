require 'dm-core'
require 'dm-timestamps'
DataMapper.setup(:default, 'mysql://localhost/sinatra-starter-kit')

require File.join(File.dirname(__FILE__), '..', 'helpers', 'config_helper.rb')
include ConfigHelper
load_files_in 'models'

def all_model_classes
  get_class_names_in(File.join(File.dirname(__FILE__), '..', 'models')).map do |name|
    Module.send :eval, name
  end
end

namespace :dm do
  
  desc "Destructively DROP and CREATE tables for DataMapper models."
  task :reset! do
    all_model_classes.each do |klass|
      klass.auto_migrate!
    end
  end
  
  desc "UPDATE tables for DataMapper models. Non-destructive."
  task :update! do
    all_model_classes.each do |klass|
      klass.auto_upgrade!
    end
  end
  
end

