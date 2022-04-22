# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :user
  has_many :visit_histories, dependent: :destroy
  validates :short_link_code, length: { minimum: 6 }, uniqueness: true
  validates :short_link_code, :url, presence: true
  validates :url, url: true
  before_validation :generate_short_link_code, on: :create

  private

  def generate_short_link_code
    base = (('a'..'z').to_a << ('A'..'Z').to_a << (0..9).to_a)
           .flatten.sample(rand(1..3)).join
    complement = DateTime.now.to_i.to_s(rand(16..32)).chars
    self.short_link_code = base + complement.sample(
      rand(5..complement.size)
    ).join
  end
end
