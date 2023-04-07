class FoodsService
  def food_search(query)
    get_url("foods/search?query=#{query}")
  end

  def food_results_count(query)
    get_url("foods/search?query=#{query}")
  end

  def conn 
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/" ) do |faraday|
      faraday.headers["X-Api-Key"] = ENV["FOOD_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end