require 'rails_helper'

RSpec.describe "Customers", type: :request do

  describe "GET /api/alpha2/customers" do
    before do
      FactoryBot.create_list(:customer, 20)
      get '/api/alpha2/customers'
    end

    it "sends a GET request and returns a 200 success status" do
      expect(response).to have_http_status(200)
    end

    it "returns all customers" do
      expect(JSON.parse(response.body).size).to eq(20)
    end
  end
end