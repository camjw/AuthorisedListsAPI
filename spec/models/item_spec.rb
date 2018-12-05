# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:wish_list) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:bought) }
  it { should validate_presence_of(:original_price) }
  it { should validate_presence_of(:bid) }
end
