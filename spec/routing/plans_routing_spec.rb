require "rails_helper"

RSpec.describe PlansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/alpha2/plans").to route_to("plans#index")
    end


    it "routes to #show" do
      expect(:get => "/api/alpha2/plans/1").to route_to("plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/alpha2/plans").to route_to("plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/alpha2/plans/1").to route_to("plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/alpha2/plans/1").to route_to("plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/alpha2/plans/1").to route_to("plans#destroy", :id => "1")
    end

  end
end
