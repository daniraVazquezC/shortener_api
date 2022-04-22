# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v1/links', type: :request do
  before do
    user = create(:user)
    login_with_api(user)
    create_list(:link, 3, user: user)
  end

  let(:valid_params) { { url: 'http://example.com' } }

  let(:invalid_params) { { url: 'http:com' } }

  describe 'GET /index' do
    context 'with authorization header' do
      it 'renders a successful response' do
        get api_v1_links_url, headers: { Authorization: authorization }
        expect(response).to be_successful
        expect(json.count).to eq(3)
      end
    end

    context 'without authorization header' do
      it 'renders a unauthorized response' do
        get api_v1_links_url
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Link' do
        expect do
          post api_v1_links_url, params: valid_params,
                                 headers: { Authorization: authorization }
        end.to change(Link, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors ' do
        expect do
          post api_v1_links_url, params: invalid_params,
                                 headers: { Authorization: authorization }
        end.to change(Link, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let(:link) { Link.first }

    context 'with valid parameters' do
      it 'updates the requested link' do
        patch api_v1_link_url(link.short_link_code),
              params: valid_params, headers: { Authorization: authorization }
        expect(response).to have_http_status(:ok)
        expect(json['url']).to eq(valid_params[:url])
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the link' do
        patch api_v1_link_url(link.short_link_code),
              params: invalid_params, headers: { Authorization: authorization }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'with existing short_link_code' do
      let(:link) { Link.first }

      it 'destroys the requested link' do
        expect do
          delete api_v1_link_url(link.short_link_code),
                 headers: { Authorization: authorization }
        end.to change(Link, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with non existing short_link_code' do
      it 'returns a error message' do
        expect do
          delete api_v1_link_url(-1), headers: { Authorization: authorization }
        end.to change(Link, :count).by(0)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
