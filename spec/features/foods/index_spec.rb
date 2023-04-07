require "rails_helper"

RSpec.describe "Foods Index" do 
  describe "after searching for a food", :vcr do 
    it "has the total number of items returned" do 
      visit root_path 
      fill_in(:q, with: "sweet potatoes") 
      click_button("Search")

      expect(page).to have_content("Count: 50000")
    end

    it "has a list of 10 foods that contain the searched food" do 
      visit root_path 
      fill_in(:q, with: "sweet potatoes") 
      click_button("Search")

      within(".ten_foods") do 
        expect(page).to have_css(".food", count: 10)
      end
    end
  end
end