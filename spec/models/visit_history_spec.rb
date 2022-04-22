# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitHistory, type: :model do
  subject { build(:visit_history) }

  describe 'associations' do
    it { is_expected.to belong_to(:link) }
  end
end
