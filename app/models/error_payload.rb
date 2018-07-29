class ErrorPayload
  attr_reader :identifier, :status

  def initialize(identifier, status)
    @identifier = identifier
    @status = status
  end

  def as_json(*)
    {
      status: Rack::Utils.status_code(status),
      error: identifier,
      error_code: translated_payload('error_code'),
      title: translated_payload('title'),
      detail: translated_payload('detail')

    }
  end

  def translated_payload(lookup)
    I18n.translate("errors.#{@identifier}.#{lookup}")
  end
end