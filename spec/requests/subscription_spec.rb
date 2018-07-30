require "rails_helper"
include Rails.application.routes.url_helpers

RSpec.describe "Subscription request", :type => :request do
  url = "api/alpha2/subscriptions"
  headers = {
    "Content-Type" => "application/json",
    "ACCEPT" => "application/json",
    "Authorization" => "Bearer 835c332034e2cbddc3080162622582"
  }
  payload = {	
            "subscription": {
              "customer_id": 1,
              "plan_id": 1
            },
            "shipping": {
              "shipping_address": "7930 Palacio del Mar Drive, Boca Raton, FL 33433"
            },
            "billing": {
              "card_number": "4242424242420089",
              "expiration_month": "01",
              "expiration_year": "2021",
              "cvv": "123",
              "zip_code": "33433"
            }
          }

  response = RestClient.post(url, payload, headers)

  it "creates a subscription" do

    post "/api/alpha2/subscriptions", json_body, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

end