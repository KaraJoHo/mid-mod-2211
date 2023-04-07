require "rails_helper"

RSpec.describe FoodsService do 
  before(:each) do 
    @service = FoodsService.new
  end

  describe "exists", :vcr do 
    it "is a service" do 
      expect(@service).to be_a(FoodsService)
    end
  end

  describe "api calls", :vcr do 
    it "can search foods" do 
      expect(@service.food_search("sweet potatoes")).to be_a(Hash)
      expect(@service.food_search("sweet potatoes")[:foods]).to be_an(Array)
      expect(@service.food_search("sweet potatoes")[:foods].first).to be_a(Hash)
      expect(@service.food_search("sweet potatoes")[:foods].first).to have_key(:description)
      expect(@service.food_search("sweet potatoes")[:foods].first).to have_key(:brandOwner)
      expect(@service.food_search("sweet potatoes")[:foods].first).to have_key(:gtinUpc)
      expect(@service.food_search("sweet potatoes")[:foods].first).to have_key(:ingredients)
    end

    it "can get the total number of results for a search" do 
      expect(@service.food_results_count("sweet potatoes")).to have_key(:totalHits)
      expect(@service.food_results_count("sweet potatoes")[:totalHits]).to be_an(Integer)
    end
  end

  describe "connection", :vcr do 
    it "connects to base api using faraday" do 
      expect(@service.conn).to be_a(Faraday::Connection)
    end
  end
end