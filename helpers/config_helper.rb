require File.join(File.dirname(__FILE__), "core_extensions.rb")
module ConfigHelper
  
  protected
  
    ## Returns an Array of .rb file names in the given directory.
    def get_files_in(directory_name)
      
      ## If directory name is not absolute, go one-up to what should
      ## be the root directory of the app. (I.e. We're in ROOT/helpers.)
      path = directory_name =~ /^\// ? directory_name : File.join(File.dirname(__FILE__), '..', directory_name)
    
      ## Only select .rb files
      Dir["#{path}/**/*.rb"].select { |e| e =~ /^.+\.rb$/ }
    end
    
    ## Converts an Array of file names to an Array of camel-cased
    ## class names based on the file names in the given directory.
    def get_class_names_in(directory_name)
      tableized_names = get_files_in(directory_name).map { |n| n.subtract(".rb") }
      tableized_names.map { |names| names.camelize }
    end

    ## Loads files in the given directory. The directory is assumed to
    ## be relative to the app root (I.e. ../).
    def load_files_in(directory_name)
      get_files_in(directory_name).sort.each { |ext| load ext }
    end

    ## Initializes DataMapper connection to MySQL
    def setup_datamapper
      require 'dm-core'
      require 'dm-timestamps'
      DataMapper.setup(:default, 'mysql://localhost/sinatra-starter-kit')
    end
end
