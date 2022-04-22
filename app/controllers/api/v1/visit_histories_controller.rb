# frozen_string_literal: true

module Api
  module V1
    class VisitHistoriesController < ApplicationController
      require 'user_agent_parser'
      before_action :set_link, only: %i[create]

      # POST /visit_histories
      def create
        VisitHistory.create(
          ip_address: ip_address,
          browser: browser,
          operating_system: operating_system,
          link: link
        )

        redirect_to link.url
      end

      private

      def user_agent
        UserAgentParser.parse request.user_agent
      end

      def operating_system
        user_agent.os.to_s
      end

      def browser
        user_agent.family
      end

      def ip_address
        request.ip
      end

      def set_link
        @link = Link.find_by(short_link_code: params[:id])
        raise ActiveRecord::RecordNotFound if @link.blank?
      end
    end
  end
end
