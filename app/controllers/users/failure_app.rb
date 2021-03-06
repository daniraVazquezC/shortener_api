# frozen_string_literal: true

module Users
  class FailureApp < Devise::FailureApp
    def respond
      self.status = 401
      self.content_type = 'json'
      self.response_body = { error: i18n_message }.to_json
    end
  end
end
