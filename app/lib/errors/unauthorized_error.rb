module Errors
  class UnauthorizedError < StandardError
    def message
      'Unauthorized!'
    end

    def code
      :unauthorized
    end
  end
end
