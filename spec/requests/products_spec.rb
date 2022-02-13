# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/products', type: :request do
  let(:valid_attributes) do
    { description: Faker::Superhero.power }
  end

  let(:invalid_attributes) do
    { description: nil }
  end

  describe 'GET /index' do
    let!(:products) { 3.times { create(:product) } }

    it 'renders a successful response' do
      get products_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = create(:product)
      get product_url(product), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Product' do
        expect do
          post products_url,
               params: { product: valid_attributes }, as: :json
        end.to change(Product, :count).by(1)
      end

      it 'renders a JSON response with the new product' do
        post products_url,
             params: { product: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Product' do
        expect do
          post products_url,
               params: { product: invalid_attributes }, as: :json
        end.to change(Product, :count).by(0)
      end

      it 'renders a JSON response with errors for the new product' do
        post products_url,
             params: { product: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { description: Faker::Superhero.power }
      end

      it 'updates the requested product' do
        product = create(:product)
        patch product_url(product),
              params: { product: new_attributes }, as: :json
        product.reload
        expect(product.description).to match(new_attributes[:description])
      end

      it 'renders a JSON response with the product' do
        product = create(:product)
        patch product_url(product),
              params: { product: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the product' do
        product = create(:product)
        patch product_url(product),
              params: { product: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested product' do
      product = create(:product)
      expect do
        delete product_url(product), as: :json
      end.to change(Product, :count).by(-1)
    end
  end
end
