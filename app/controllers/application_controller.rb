class ApplicationController < ActionController::API
  include ErrorRespondable
  include Authenticable

  def index
    render json: {status: :ok}
  end
end
