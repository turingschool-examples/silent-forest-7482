require'rails_helper'

RSpec.describe 'Chefs show page' do
  before(:each) do
    @grinch = Chef.create(name: "Chef Grinch")
    @tunatartare = @grinch.dishes.create(name: "Tuna Tartare", description: "Beautiful Tuna Dish with crispy wontons." )
    @tuna = Ingredient.create(name: "Tuna", calories: 60)
    @wonton = Ingredient.create(name: "Won Tons", calories: 100)
    @tuna1 = Ingredient.create(name: "Tuna", calories: 60)
    Recipe.create(dish: @tunatartare, ingredient: @tuna)
    Recipe.create(dish: @tunatartare, ingredient: @wonton)

    visit "/chefs/#{@grinch.id}"
  end

  it "has the name of the chef" do
    expect(page).to have_content(@grinch.name)
  end

  it "has the name of the dishes and their descriptions" do
    expect(page).to have_content(@tunatartare.name)
    expect(page).to have_content(@tunatartare.description)
  end

  it "see the name and calories of all ingredients for this chef, and the ingrdients are unique, are ordered from most calories to  least calories"do
    expect(page).to have_content("Recipe Ingredients")

    expect(@wonton).to appear_before(@tuna)
    expect(page).to_not have_content(@tuna1.name)
  end

  it "button to delete a dish, I click the button i am returned to the chefs show page and the dish is not longer there." do
    expect(page).to have_button("Delete Dish")
    click_button("Delete Dish")
    expect(current_path).to eq("/chefs/#{@tunatartare.id}")
    expect(page).to_not have_content(@tunatartare)
  end
end
