# frozen_string_literal: true

# spec/requests/wish_lists_spec.rb
require 'rails_helper'

RSpec.describe 'WishLists API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:wish_lists) { create_list(:wish_list, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { wish_lists.first.id }

  # Test suite for GET /users/:user_id/wish_lists
  describe 'GET /users/:user_id/wish_lists' do
    before { get "/users/#{user_id}/wish_lists" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user wish_lists' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /users/:user_id/wish_lists/:id
  describe 'GET /users/:user_id/wish_lists/:id' do
    before { get "/users/#{user_id}/wish_lists/#{id}" }

    context 'when user wish_list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the wish_list' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user wish_list does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find WishList/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/wish_lists
  describe 'POST /users/:user_id/wish_lists' do
    let(:valid_attributes) { { name: 'Stuff', viewable: 0 } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/wish_lists", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/wish_lists", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/wish_lists/:id
  describe 'PUT /users/:user_id/wish_lists/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before do
      put "/users/#{user_id}/wish_lists/#{id}",
          params: valid_attributes
    end

    context 'when wish_list exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the wish_list' do
        updated_wish_list = WishList.find(id)
        expect(updated_wish_list.name).to match(/Mozart/)
      end
    end

    context 'when the wish_list does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find WishList/)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}/wish_lists/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
