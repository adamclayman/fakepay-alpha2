require "rails_helper"
include Rails.application.routes.url_helpers

RSpec.describe "Customer request", :type => :request do
  url = customers_url
  headers = {
    "Content-Type" => "application/json",
    "ACCEPT" => "application/json",
    "Authorization" => "Bearer 835c332034e2cbddc3080162622582"
  }
end
  # CONTINUE BUILDING FROM HERE