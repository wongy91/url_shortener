# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)
require "rspec/rails"

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
