# frozen_string_literal: true

RSpec.describe 'Products API', type: :request do
  let(:user) { create(:user) }
  # initialize test data
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }
  let(:headers) { valid_headers }
  # Test suite for GET /products
  describe 'GET /products' do
    # make HTTP get request before each example
    before { get '/products', headers: headers }

    it 'returns products' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /products/:id
  describe 'GET /products/:id' do
    before { get "/products/#{product_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:product_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end

  # Test suite for POST /products
  describe 'POST /products' do
    # valid payload
    let(:valid_attributes) do
      { name: 'Toothbrush', url: 'www.google.com',
        producer: 'Google', current_price: 50 }.to_json
    end

    context 'when the request is valid' do
      before { post '/products', params: valid_attributes, headers: headers }

      it 'creates a product' do
        expect(json['name']).to eq('Toothbrush')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/products', params: { email: 'Foobar' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to include("Validation failed: Name can't be blank")
      end
    end
  end

  # Test suite for PUT /products/:id
  describe 'PUT /products/:id' do
    let(:valid_attributes) do
      { name: 'Shopping', url: 'www.google.com',
        producer: 'Google', current_price: '£100' }.to_json
    end

    context 'when the record exists' do
      before { put "/products/#{product_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /products/:id
  describe 'DELETE /products/:id' do
    before { delete "/products/#{product_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
