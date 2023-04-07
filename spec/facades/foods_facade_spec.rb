require "rails_helper"

RSpec.describe FoodsFacade do 
  before(:each) do 
    @facade = FoodsFacade.new 
  end

  describe "Foods Facade", :vcr do 
    it "exists" do 
      expect(@facade).to be_a(FoodsFacade)
    end

    it "has a food_search api call" do 
      expect(@facade.food_search("sweet potatoes")).to be_a(Array)
      expect(@facade.food_search("sweet potatoes").first).to be_a(Food)
      expect(@facade.food_search("sweet potatoes").count).to eq(10)
    end

    it "has the total number of search results" do 
      expect(@facade.food_results_count("sweet potatoes")).to eq(51270)
    end
  end
end