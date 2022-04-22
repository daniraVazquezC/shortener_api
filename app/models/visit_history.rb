class VisitHistory < ApplicationRecord
  belongs_to :link, counter_cache: :visitor_counter
end
