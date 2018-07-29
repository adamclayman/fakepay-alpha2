require "rails_helper"

RSpec.describe SubscriptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/alpha2/subscriptions").to route_to("subscriptions#index")
    end


    it "routes to #show" do
      expect(:get => "/api/alpha2/subscriptions/1").to route_to("subscriptions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/alpha2/subscriptions").to route_to("subscriptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/alpha2/subscriptions/1").to route_to("subscriptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/alpha2/subscriptions/1").to route_to("subscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/alpha2/subscriptions/1").to route_to("subscriptions#destroy", :id => "1")
    end

  end
end
