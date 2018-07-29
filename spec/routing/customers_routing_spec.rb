require "rails_helper"

RSpec.describe CustomersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/alpha2/customers").to route_to("customers#index")
    end


    it "routes to #show" do
      expect(:get => "/api/alpha2/customers/1").to route_to("customers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/alpha2/customers").to route_to("customers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/alpha2/customers/1").to route_to("customers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/alpha2/customers/1").to route_to("customers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/alpha2/customers/1").to route_to("customers#destroy", :id => "1")
    end

  end
end
