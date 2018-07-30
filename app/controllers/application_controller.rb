class ApplicationController < ActionController::API
  include SubscriptionsHelper

  def render_payload(type, identifier, status = :bad_request)
    render json: RenderPayload.new(type, identifier, status), status: status
  end
end