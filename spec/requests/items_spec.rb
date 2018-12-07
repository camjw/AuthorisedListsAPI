# frozen_string_literal: true

# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Items API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:wish_list) { create(:wish_list, created_by: user.id) }
  let!(:items) { create_list(:item, 20, wish_list_id: wish_list.id) }
  let(:wish_list_id) { wish_list.id }
  let(:id) { items.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /wish_lists/:wish_list_id/items
  describe 'GET /wish_lists/:wish_list_id/items' do
    before { get "/wish_lists/#{wish_list_id}/items", headers: headers }

    context 'when wish_list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all wish_list items' do
        expect(json.size).to eq(20)
      end
    end

    context 'when wish_list does not exist' do
      let(:wish_list_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find WishList/)
      end
    end
  end

  # Test suite for GET /wish_lists/:wish_list_id/items/:id
  describe 'GET /wish_lists/:wish_list_id/items/:id' do
    before { get "/wish_lists/#{wish_list_id}/items/#{id}", headers: headers }

    context 'when wish_list item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when wish_list item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for PUT /wish_lists/:wish_list_id/items
  describe 'POST /wish_lists/:wish_list_id/items' do
    let(:valid_attributes) do
      { name: 'Stuff', bought: 0, original_price: 100, bid: 10 }.to_json
    end

    context 'when request attributes are valid' do
      before do
        post "/wish_lists/#{wish_list_id}/items",
             params: valid_attributes,
             headers: headers
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/wish_lists/#{wish_list_id}/items", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /wish_lists/:wish_list_id/items/:id
  describe 'PUT /wish_lists/:wish_list_id/items/:id' do
    let(:valid_attributes) { { name: 'Mozart' }.to_json }

    before do
      put "/wish_lists/#{wish_list_id}/items/#{id}",
          params: valid_attributes,
          headers: headers
    end

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Mozart/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /wish_lists/:id
  describe 'DELETE /wish_lists/:id' do
    before { delete "/wish_lists/#{wish_list_id}/items/#{id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
