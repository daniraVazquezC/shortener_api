# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found
    render json: { error: 'No match found' }.to_json, status: :not_found
  end
end
