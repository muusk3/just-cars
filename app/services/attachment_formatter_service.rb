class AttachmentFormatterService
  def self.data_from_url(url_string, filename: nil)
    file = URIService.new(url_string)
    filename ||= file.filename

    {
      io: file.uri,
      filename: [filename, file.extension].join('.')
    }
  end
end
