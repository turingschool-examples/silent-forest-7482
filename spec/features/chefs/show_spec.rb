require'rails_helper'

RSpec.describe 'Chefs show page' do
  before(:each) do
    @grinch = Chef.create(name: "Chef Grinch")
    @tunatartare = @grinch.dishes.create(name: "Tuna Tartare", description: "Beautiful Tuna Dish with crispy wontons." )
    @tuna = Ingredient.create(name: "tuna", calories: 60.00)
    @wonton = Ingredient.create(name: "wontton", calories: 150.00)
    Recipe.create(dish: @tunatartare, ingredient: @tuna)
    Recipe.create(dish: @tunatartare, ingredient: @wonton)

    @olive = Chef.create(name: "Chef Olive")
    @cupcake = @grinch.dishes.create(name: "Brownies", description: "Triple Fudge dark chocolate freshed baked brownies" )
    @flour = Ingredient.create(name: "cake four", calories: 70.00)
    @eggs = Ingredient.create(name: "fresh farm eggs", calories: 45.00)

    Recipe.create(dish: @cupake, ingredient: @flour)
    Recipe.create(dish: @cupake, ingredient: @eggs)
    visit "/chefs/#{@grinch.id}"
  end

  it "has the name of the chef" do
    expect(page).to have_content(@grinch.name)
  end

  it "has the name of the dishes and their descriptions" do
    expect(page).to have_content(@tunatartare.name)
    expect(page).to have_content(@tunatartare.description)
  end
end
