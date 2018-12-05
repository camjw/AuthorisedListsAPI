# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:wish_lists) }
end
