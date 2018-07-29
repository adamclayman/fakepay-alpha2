class ApplicationController < ActionController::API
  include SubscriptionsHelper
  
  def render_error_payload(identifier, status: :bad_request)
    render json: ErrorPayload.new(identifier, status), status: status
  end
end