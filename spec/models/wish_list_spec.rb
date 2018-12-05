# spec/models/todo_spec.rb
require 'rails_helper'
# Test suite for the Todo model
RSpec.describe WishList, type: :model do
  it 'has lots of items' do
    expect(subject).to have_many(:items)
  end
end
