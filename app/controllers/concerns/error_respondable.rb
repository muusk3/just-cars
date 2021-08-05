module ErrorRespondable
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :error_response
  end

  protected

    def error_response(err)
      code = err.code if err.respond_to?(:code)
      json_response(err.message, code || :bad_request)
    end

    def json_response(message = :ok, status = :ok)
      render json: { message: message }, status: get_code(status)
    end

    def get_code(status)
      ::Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a?(::Symbol)
    end
end
