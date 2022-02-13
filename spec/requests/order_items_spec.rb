# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/order_items', type: :request do
  let!(:product) { create(:product) }
  let!(:purchase_order) { create(:purchase_order) }

  let(:valid_attributes) do
    {
      product_id: product.id,
      purchase_order_id: purchase_order.id,
      quantity: 12
    }
  end

  let(:invalid_attributes) do
    {
      product_id: product.id,
      purchase_order_id: purchase_order.id,
      quantity: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:order_item)
      get order_items_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      order_item = create(:order_item)
      get order_item_url(order_item), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new OrderItem' do
        expect do
          post order_items_url,
               params: { order_item: valid_attributes }, as: :json
        end.to change(OrderItem, :count).by(1)
      end

      it 'renders a JSON response with the new order_item' do
        post order_items_url,
             params: { order_item: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new OrderItem' do
        expect do
          post order_items_url,
               params: { order_item: invalid_attributes }, as: :json
        end.to change(OrderItem, :count).by(0)
      end

      it 'renders a JSON response with errors for the new order_item' do
        post order_items_url,
             params: { order_item: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          quantity: 12
        }
      end

      it 'updates the requested order_item' do
        order_item = create(:order_item)
        patch order_item_url(order_item),
              params: { order_item: new_attributes }, as: :json
        order_item.reload
        expect(order_item.quantity).to match(12)
      end

      it 'renders a JSON response with the order_item' do
        order_item = create(:order_item)
        patch order_item_url(order_item),
              params: { order_item: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the order_item' do
        order_item = create(:order_item)
        patch order_item_url(order_item),
              params: { order_item: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested order_item' do
      order_item = create(:order_item)
      expect do
        delete order_item_url(order_item), as: :json
      end.to change(OrderItem, :count).by(-1)
    end
  end
end
