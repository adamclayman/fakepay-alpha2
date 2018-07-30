class RenderPayload
  attr_reader :type, :identifier, :status

  def initialize(type, identifier, status)
    @type = type
    @identifier = identifier
    @status = status
  end

  def as_json(*)
    {
      status: Rack::Utils.status_code(status),
      type: type,
      error: identifier,
      error_code: translated_payload('error_code'),
      title: translated_payload('title'),
      detail: translated_payload('detail')

    }
  end

  def translated_payload(lookup)
    I18n.translate("#{@type}.responses.#{@identifier}.#{lookup}")
  end
end