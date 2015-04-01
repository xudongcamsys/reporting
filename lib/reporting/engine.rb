require 'haml-rails'
require 'ransack'
require 'csv'
require 'kaminari'

module Reporting
  class Engine < ::Rails::Engine
    # Autoload from lib directory
    config.autoload_paths << File.expand_path('../../', __FILE__)
    
    isolate_namespace Reporting

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
