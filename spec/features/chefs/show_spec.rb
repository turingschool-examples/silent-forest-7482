require 'rails_helper'

RSpec.describe "Chef show page" do
  describe 'when I visit the chef show page' do
    it 'shows me the name of the chef and name and descriptions for all chef dishes' do
      ramsay = Chef.create(name: "Gordon Ramsay")
      salmon_dish = ramsay.dishes.create(name: "Sizzled Salmon", description: "Sizzled and Fizzled, delectable delight.")
      ice_cream = ramsay.dishes.create(name: "Pecan Ice Cream", description: "Nice way to end a fishy note")

      visit "/chefs/#{ramsay.id}"

      expect(page).to have_content("Gordon Ramsay")
      expect(page).to have_content("Sizzled Salmon")
      expect(page).to have_content("Sizzled and Fizzled, delectable delight.")
      expect(page).to have_content("Pecan Ice Cream")
      expect(page).to have_content("Nice way to end a fishy note")
    end

    it 'can show me the name and calories of all ingredients this chef uses for this dish' do
      ramsay = Chef.create(name: "Gordon Ramsay")
      salmon_dish = ramsay.dishes.create(name: "Sizzled Salmon", description: "Sizzled and Fizzled, delectable delight.")
      salmon_dish.ingredients.create(name: "Butter", calories: 150)
      salmon_dish.ingredients.create(name: "Salmon", calories: 430)
      salmon_dish.ingredients.create(name: "Thyme", calories: 1)

      ice_cream_dish = ramsay.dishes.create(name: "Thyme Pecan Ice Cream", description: "Nice way to end a fishy note")
      ice_cream_dish.ingredients.create(name: "Ice Cream", calories: 150)
      ice_cream_dish.ingredients.create(name: "Thyme", calories: 1)

      visit "/chefs/#{ramsay.id}"
    end
  end
end
