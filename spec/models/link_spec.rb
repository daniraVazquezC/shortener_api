# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { create(:link) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:visit_histories) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
  end
end
