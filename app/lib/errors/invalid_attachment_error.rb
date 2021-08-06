module Errors
  class InvalidAttachmentError < StandardError
    def message
      'Invalid attachment!'
    end
  end
end
