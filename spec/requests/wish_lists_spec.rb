require 'rails_helper'

RSpec.describe 'WishLists API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:wish_lists) { create_list(:wish_list, 10, created_by: user.id) }
  let(:wish_list_id) { wish_lists.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /wish_lists
  describe 'GET /wish_lists' do
    # make HTTP get request before each example
    before { get '/wish_lists', params: {}, headers: headers }

    it 'returns wish_lists' do
      puts valid_headers
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /wish_lists/:id
  describe 'GET /wish_lists/:id' do
    before { get "/wish_lists/#{wish_list_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the wish_list' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(wish_list_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:wish_list_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find WishList/)
      end
    end
  end

  # Test suite for POST /wish_lists
  describe 'POST /wish_lists' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', viewable: 0, created_by: user.id.to_s }.to_json }

    context 'when the request is valid' do
      before { post '/wish_lists', params: valid_attributes, headers: headers }

      it 'creates a wish_list' do
        puts json
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil }.to_json }
      before { post '/wish_lists', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /wish_lists/:id
  describe 'PUT /wish_lists/:id' do
    let(:valid_attributes) { { name: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/wish_lists/#{wish_list_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /wish_lists/:id
  describe 'DELETE /wish_lists/:id' do
    before { delete "/wish_lists/#{wish_list_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
