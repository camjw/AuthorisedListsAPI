# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe WishList, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:items) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:viewable) }
end
