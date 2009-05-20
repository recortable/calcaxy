# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.middleware.use "CalcaxyOld", "#{RAILS_ROOT}/public/calcaxy_old"
  config.time_zone = 'UTC'

  config.gem 'RedCloth', :version => "= 3.0.3"

end


