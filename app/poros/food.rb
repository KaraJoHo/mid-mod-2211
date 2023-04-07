class Food 
  attr_reader :description, 
              :gtinupc, 
              :brand_owner, 
              :ingredients

  def initialize(food_info)
    @description = food_info[:description]
    @gtinupc = food_info[:gtinUpc]
    @brand_owner = food_info[:brandOwner]
    @ingredients = food_info[:ingredients]
  end
end