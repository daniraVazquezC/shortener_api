# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/visit_histories', type: :request do
  describe 'POST /create' do
    let(:link) { create(:link) }

    it 'creates a new VisitHistory' do
      expect do
        get "/#{link.short_link_code}"
      end.to change(VisitHistory, :count).by(1)
    end
  end
end
