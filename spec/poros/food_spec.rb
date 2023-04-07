require "rails_helper"

RSpec.describe Food do 
  before(:each) do 
    attrs = {
              :fdcId=>983525,
              :description=>"SWEET POTATOES",
              :dataType=>"Branded",
              :gtinUpc=>"8901020020844",
              :publishedDate=>"2020-06-26",
              :brandOwner=>"NOT A BRANDED ITEM",
              :ingredients=>"ORGANIC SWEET POTATOES.",
              :marketCountry=>"United States",
              :foodCategory=>"Pre-Packaged Fruit & Vegetables",
              :modifiedDate=>"2020-04-13",
              :dataSource=>"LI",
              :servingSizeUnit=>"g",
              :servingSize=>133.0
    }
    @food = Food.new(attrs)
  end

  describe "Food" do 
    it "exists and has attributes" do 
      expect(@food).to be_a(Food)
      expect(@food.description).to eq("SWEET POTATOES")
      expect(@food.gtinupc).to eq("8901020020844")
      expect(@food.brand_owner).to eq("NOT A BRANDED ITEM")
      expect(@food.ingredients).to eq("ORGANIC SWEET POTATOES.")
    end
  end
end