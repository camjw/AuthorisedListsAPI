# frozen_string_literal: true

RSpec.describe 'Items API', type: :request do
  # initialize test data
  let!(:items) { create_list(:item, 10) }
  let(:item_id) { items.first.id }

  # Test suite for GET /items
  describe 'GET /items' do
    # make HTTP get request before each example
    before { get '/items' }

    it 'returns items' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /items/:id
  describe 'GET /items/:id' do
    before { get "/items/#{item_id}" }

    context 'when the record exists' do
      it 'returns the item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for POST /items
  describe 'POST /items' do
    # valid payload
    let(:valid_attributes) { { name: 'Toothbrush', bought: 0, original_price: 100, bid: 50 } }

    context 'when the request is valid' do
      before { post '/items', params: valid_attributes }

      it 'creates a item' do
        expect(json['name']).to eq('Toothbrush')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/items', params: { email: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to include("Validation failed: Name can't be blank")
      end
    end
  end

  # Test suite for PUT /items/:id
  describe 'PUT /items/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/items/#{item_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /items/:id
  describe 'DELETE /items/:id' do
    before { delete "/items/#{item_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
