require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do

  describe "GET /api/alpha2/subscriptions" do
    before do
      FactoryBot.create_list(:subscription, 3)
      get '/api/alpha2/subscriptions'
    end

    it "sends a GET request and returns a 200 success status" do
      expect(response).to have_http_status(200)
    end

    it "returns all subscriptions" do
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end