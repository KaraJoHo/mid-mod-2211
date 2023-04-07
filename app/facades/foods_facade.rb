class FoodsFacade 
  def food_search(query)
    conn = Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/" ) do |faraday|
      faraday.headers["X-Api-Key"] = ENV["FOOD_KEY"]
    end

    search_response = conn.get("foods/search?query=#{query}")

    parsed = JSON.parse(search_response.body, symbolize_names: true)
   
    parsed[:foods].map do |food_info| 
      Food.new(food_info)
    end[0..9]
  end

  def food_results_count(query)
    conn = Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/" ) do |faraday|
      faraday.headers["X-Api-Key"] = ENV["FOOD_KEY"]
    end

    search_response = conn.get("foods/search?query=#{query}")

    parsed = JSON.parse(search_response.body, symbolize_names: true)

    parsed[:totalHits]
  end

end