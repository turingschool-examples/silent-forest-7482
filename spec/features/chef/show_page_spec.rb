require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before(:each) do
    @chef = Chef.create!(name: "Kernel Sanders")
    @chicken = @chef.dishes.create!(name: "Kentucky Fried Chicken", description: "Very crispy chicken")
    @mashed_potatoes = @chef.dishes.create!(name: "Mashed Potatoes", description: "Very buttery potatoes")
    @batter = @chicken.ingredients.create!(name: "Chicken Batter", calories: 450)
    @butter = @mashed_potatoes.ingredients.create!(name: "Butter", calories: 500)
    DishIngredient.create!(dish: @chicken, ingredient: @batter)
    DishIngredient.create!(dish: @mashed_potatoes, ingredient: @butter)
    DishIngredient.create!(dish: @mashed_potatoes, ingredient: @batter)
    visit "/chefs/#{@chef.id}"
  end

  it 'shows the chefs attributes' do
    expect(page).to have_content(@chef.name)
    expect(page).to have_content("#{@chef.name}'s Dishes:")
    expect(page).to have_content(@chicken.name)
    expect(page).to have_content(@chicken.description)
    expect(page).to have_content(@mashed_potatoes.name)
    expect(page).to have_content(@mashed_potatoes.description)
  end

  it 'shows the name and calories of all ingredients this chef uses in their dishes' do
    expect(page).to have_content(@batter.name)
    expect(page).to have_content(@batter.calories)
    expect(page).to have_content(@butter.name)
    expect(page).to have_content(@butter.calories)
  end

  it 'shows unique ingredient names' do
    expect(page).to have_content(@batter.name, count: 1)
    expect(page).to have_content(@butter.name, count: 1)
  end

  it 'shows ingredients ordered from most calories to least' do
    expect(page.all(".ingredient")[0].text).to eq("#{@butter.name}, #{@butter.calories}")
    expect(page.all(".ingredient")[1].text).to eq("#{@batter.name}, #{@batter.calories}")
  end
end
