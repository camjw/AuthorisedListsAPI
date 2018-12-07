# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:wish_lists) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
