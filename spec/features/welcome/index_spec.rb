require "rails_helper"

RSpec.describe "Welcome Page" do 
  before(:each) do 
    visit root_path
  end

  describe "When visiting '/'", :vcr do 
    it "Has a form to search for a food item" do 
      expect(page).to have_field(:q)
      expect(page).to have_button "Search"
    end

    it "After filling in the form and clicking to search, it will redirect to '/foods'" do 
      fill_in(:q, with: "sweet potatoes") 
      click_button("Search")
      expect(current_path).to eq(foods_path)
    end
  end
end