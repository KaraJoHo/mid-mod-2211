class FoodsController < ApplicationController 
  def index 
    @foods = FoodsFacade.new.food_search(params[:q])
    @count = FoodsFacade.new.food_results_count(params[:q])
  end
end