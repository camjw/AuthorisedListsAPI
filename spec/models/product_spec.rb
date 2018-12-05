
require 'spec_helper'
require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:items) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:producer) }
  it { should validate_presence_of(:current_price) }
end
