module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate!
  end

  def authenticate!
    raise Errors::UnauthorizedError unless valid_token?
  end

  protected

    def auth_header
      request.authorization
    end

    def valid_token?
      return false unless auth_header
      auth_header == Rails.application.credentials.authorization_token
    end
end
