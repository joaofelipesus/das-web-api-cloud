# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/purchase_orders', type: :request do
  let!(:client) { create(:client) }

  let(:valid_attributes) do
    {
      client_id: client.id,
      date: Date.current
    }
  end

  let(:invalid_attributes) do
    {
      client_id: nil,
      date: nil
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:purchase_order)
      get purchase_orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      purchase_order = create(:purchase_order)
      get purchase_order_url(purchase_order), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new PurchaseOrder' do
        expect do
          post purchase_orders_url,
               params: { purchase_order: valid_attributes }, headers: valid_headers, as: :json
        end.to change(PurchaseOrder, :count).by(1)
      end

      it 'renders a JSON response with the new purchase_order' do
        post purchase_orders_url,
             params: { purchase_order: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new PurchaseOrder' do
        expect do
          post purchase_orders_url,
               params: { purchase_order: invalid_attributes }, as: :json
        end.to change(PurchaseOrder, :count).by(0)
      end

      it 'renders a JSON response with errors for the new purchase_order' do
        post purchase_orders_url,
             params: { purchase_order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          client_id: client.id,
          date: 3.days.from_now
        }
      end

      it 'updates the requested purchase_order' do
        purchase_order = create(:purchase_order)
        patch purchase_order_url(purchase_order),
              params: { purchase_order: new_attributes }, headers: valid_headers, as: :json
        purchase_order.reload
        expect(purchase_order.date).to match(3.days.from_now.to_date)
      end

      it 'renders a JSON response with the purchase_order' do
        purchase_order = create(:purchase_order)
        patch purchase_order_url(purchase_order),
              params: { purchase_order: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the purchase_order' do
        purchase_order = create(:purchase_order)
        patch purchase_order_url(purchase_order),
              params: { purchase_order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested purchase_order' do
      purchase_order = create(:purchase_order)
      expect do
        delete purchase_order_url(purchase_order), headers: valid_headers, as: :json
      end.to change(PurchaseOrder, :count).by(-1)
    end
  end
end
