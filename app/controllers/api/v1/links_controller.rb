# frozen_string_literal: true

module Api
  module V1
    class LinksController < ApplicationController
      before_action :set_link, only: %i[update destroy]
      before_action :authenticate_user!

      # GET /api/v1/links
      def index
        render json: current_user.links, base_url: base_url
      end

      # POST /api/v1/links
      def create
        link = Link.new(url: params[:url], user: current_user)
        if link.save
          render json: link, base_url: base_url, status: :created
        else
          render json: link.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/links/:id
      def update
        if @link.update(url: params[:url])
          render json: @link, base_url: base_url, status: :ok
        else
          render json: @link.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/links/:id
      def destroy
        @link.destroy
      end

      private

      def set_link
        @link = Link.find_by(short_link_code: params[:id])
        raise ActiveRecord::RecordNotFound if @link.blank?
      end

      def base_url
        request.base_url
      end
    end
  end
end
