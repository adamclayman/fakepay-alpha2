class ApplicationController < ActionController::API
  include SubscriptionsHelper
  
  def render_payload(identifier, status = :bad_request)
    render json: RenderPayload.new(identifier, status), status: status
  end
end