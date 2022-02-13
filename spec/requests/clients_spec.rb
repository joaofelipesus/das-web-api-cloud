# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/clients', type: :request do
  let(:valid_attributes) do
    {
      name: Faker::TvShows::SiliconValley.character,
      surname: Faker::TvShows::SiliconValley.app,
      cpf: CPF.generate
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      surname: nil,
      cpf: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:client)
      get clients_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      client = create(:client)
      get client_url(client), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Client' do
        expect do
          post clients_url,
               params: { client: valid_attributes }, as: :json
        end.to change(Client, :count).by(1)
      end

      it 'renders a JSON response with the new client' do
        post clients_url,
             params: { client: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Client' do
        expect do
          post clients_url,
               params: { client: invalid_attributes }, as: :json
        end.to change(Client, :count).by(0)
      end

      it 'renders a JSON response with errors for the new client' do
        post clients_url,
             params: { client: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: Faker::TvShows::SiliconValley.character }
      end

      it 'updates the requested client' do
        client = create(:client)
        patch client_url(client),
              params: { client: new_attributes }, as: :json
        client.reload
        expect(client.name).to match(new_attributes[:name])
      end

      it 'renders a JSON response with the client' do
        client = create(:client)
        patch client_url(client),
              params: { client: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the client' do
        client = create(:client)
        patch client_url(client),
              params: { client: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested client' do
      client = create(:client)
      expect do
        delete client_url(client), as: :json
      end.to change(Client, :count).by(-1)
    end
  end
end
