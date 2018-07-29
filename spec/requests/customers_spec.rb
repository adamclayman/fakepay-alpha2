require 'rails_helper'

RSpec.describe "Customers", type: :request do

  describe "GET /customers" do
    let!(:customers) {FactoryBot.create(:customer, 25)}

    before { get '/'}

    it "sends a GET request and returns a 200 success status" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "returns all customers, including the 4 customers in seeds.rb" do
      get customers_path


    end

  end
end