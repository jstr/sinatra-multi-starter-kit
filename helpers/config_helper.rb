require File.join(File.dirname(__FILE__), "core_extensions.rb")
module ConfigHelper
  
  protected
  
  ## Returns an Array of .rb file names in the given directory.
  ## Options:
  ## If :traverse => true is set, recurses into sub-directories to
  ## load files. Defaults to false.
  ## If :full_paths => false is set, returns file names without any
  ## paths. E.g. /Apps/file_name.rb vs. file_name.rb.
  def get_files_in(directory_name, options = {})
    options = {
      :traverse => false,
      :full_paths => true
    }.merge(options)
    
    ## If directory name is not absolute, go one-up to what should
    ## be the root directory of the app. (I.e. We're in ROOT/helpers.)
    path = directory_name =~ /^\// ? directory_name : File.join(File.dirname(__FILE__), '..', directory_name)
    
    pattern = options[:traverse] ? "/**/*.rb" : "/*.rb"
    files = Dir[path + pattern].select { |e| e =~ /^.+\.rb$/ }

    if options[:full_paths]
      files
    else
      files.map { |file| file.match(/\/([A-Za-z0-9_]+\.rb)$/)[1] }
    end
  end
  
  ## Converts an Array of file names to an Array of camel-cased
  ## class names based on the file names in the given directory.
  ## For options see #get_files_in.
  def get_class_names_in(directory_name, options = {})
    tableized_names = get_files_in(directory_name, { :full_paths => false }.merge(options)).map { |n| n.subtract(".rb") }
    tableized_names.map { |names| names.camelize }
  end

  ## Loads files in the given directory. The directory is assumed to
  ## be relative to the app root (I.e. ../).
  ## For options see #get_files_in.
  def load_files_in(directory_name, options = {})
    get_files_in(directory_name, options).sort.each { |ext| load ext }
  end

  ## Initializes DataMapper connection to MySQL
  def setup_datamapper
    require 'dm-core'
    require 'dm-timestamps'
    DataMapper.setup(:default, 'mysql://localhost/sinatra-starter-kit')
  end
end
