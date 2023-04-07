class FoodsFacade 
  def food_search(query)
    parsed = service.food_search(query)
   
    parsed[:foods].map do |food_info| 
      Food.new(food_info)
    end[0..9]
  end

  def food_results_count(query)
    parsed = service.food_results_count(query)
    parsed[:totalHits]
  end

  def service 
    @service ||= FoodsService.new
  end

  def food_search_call
    @food_search_call ||= food_search(query)
  end

  def food_results_count_call 
    @food_results_count_call ||= food_results_count(query)
  end
end