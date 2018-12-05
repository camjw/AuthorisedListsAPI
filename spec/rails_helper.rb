# frozen_string_literal: true

# require database cleaner at the top level
require 'database_cleaner'
require 'spec_helper'
require 'factory_bot'

RSpec.configure do |config|

  config.include FactoryBot::Syntax::Methods

end
