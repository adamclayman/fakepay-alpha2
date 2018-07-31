class ApplicationController < ActionController::API
  include SubscriptionsHelper

  def render_payload(type, identifier, status = :bad_request, confirmation_object = nil)
    render json: RenderPayload.new(type, identifier, status, confirmation_object), status: status
  end
end