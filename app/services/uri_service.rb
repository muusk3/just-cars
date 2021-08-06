require 'open-uri'

class URIService
  def initialize(file)
    @file = file
  end

  def read
    uri.read
  end

  def filename
    File.basename(URI.parse(@file).path)
  end

  def content_type
    uri.content_type.to_s
  end

  def extension
    Mime::Type.lookup(content_type).symbol.to_s
  end

  def uri
    call_with_rescue {
      @uri ||= URI.open(@file)
    }
  end

  private

    def call_with_rescue
      yield
    rescue StandardError
      raise Errors::InvalidAttachmentError
    end
end
