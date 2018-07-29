require 'rails_helper'

RSpec.describe "Plans", type: :request do

  describe "GET /api/alpha2/plans" do
    before do
      FactoryBot.create_list(:plan, 3)
      get '/api/alpha2/plans'
    end

    it "sends a GET request and returns a 200 success status" do
      expect(response).to have_http_status(200)
    end

    it "returns all plans" do
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end