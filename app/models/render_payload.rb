class RenderPayload
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

  def translated_payload_charge(lookup)
    I18n.translate("responses.charge.#{@identifier}.#{lookup}")
  end


  def translated_payload_subscription(lookup)
    I18n.translate("responses.subscription.#{@identifier}.#{lookup}")
  end
end