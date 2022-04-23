# frozen_string_literal: true

module Api
  module V1
    class LinkSerializer < ActiveModel::Serializer
      attributes :id, :url, :short_link_code, :short_link

      def short_link
        "#{instance_options[:base_url]}/#{object.short_link_code}"
      end
    end
  end
end
