require "rails_helper"

RSpec.describe "Foods Index" do 
  describe "after searching for a food", :vcr do 
    it "has the total number of items returned" do 
      visit root_path 
      fill_in(:q, with: "sweet potatoes") 
      click_button("Search")

      expect(page).to have_content("Number of Results: 51270")
      expect(page).to_not have_content("Number of Results: 1")
    end

    it "has a list of 10 foods that contain the searched food" do 
      visit root_path 
      fill_in(:q, with: "sweet potatoes") 
      click_button("Search")

      within(".ten_foods") do 
        expect(page).to have_css(".food", count: 10)
        expect(page).to have_content("Description: SWEET POTATOES")
        expect(page).to have_content("GTIN/UPC: 8901020020844")
        expect(page).to have_content("Brand Owner: NOT A BRANDED ITEM")
        expect(page).to have_content("Ingredients: ORGANIC SWEET POTATOES.")
        expect(page).to_not have_content("Brand Owner: Blue Diamond")
        expect(page).to_not have_content("Water")
        expect(page).to_not have_content("Peanuts")
      end
    end
  end
end