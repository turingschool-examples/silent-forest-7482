require 'rails_helper'

RSpec.describe 'the chef show' do
  before(:each) do
    @chef = Chef.create!(name: 'Mike Piz')

    @dish_1 = @chef.dishes.create!(name: 'ravioli', description: 'chef boy rds')
    @dish_2 = @chef.dishes.create!(name: 'poptart', description: 'toaster ready and yummy')
    @dish_3 = @chef.dishes.create!(name: 'ribeye steak', description: 'expensive, lovely, and fresh')

    @ingredient_1 = @dish_1.ingredients.create!(name: 'italian pasta sauce', calories: 100)
    @ingredient_2 = @dish_2.ingredients.create!(name: 'unknown chocolate', calories: 30)
    @ingredient_3 = @dish_3.ingredients.create!(name: 'Salt and pepper', calories: 10)

    DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
  end


  it 'displays the chefs name and description of its dishes' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_3.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_2.description)
    expect(page).to have_content(@dish_3.description)
  end

  it 'displays unique ingredients names and calories ordered by highest caloric dishes first' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@ingredient_1.name, count: 1)
    expect(page).to have_content(@ingredient_1.calories, count: 1)

    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.calories)

    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_3.calories)

    expect(@ingredient_1.name).to appear_before(@ingredient_2.name)
    expect(@ingredient_2.name).to appear_before(@ingredient_3.name)
  end

  it "clicks button to remove dish from chef and redirects to show no longer displaying that dish" do
    visit "/chefs/#{@chef.id}"

    within "#delete-#{@dish_1.id}" do
      expect(page).to have_button("remove from chef")
    end

    within "#delete-#{@dish_2.id}" do
      expect(page).to have_button("remove from chef")
    end

    within "#delete-#{@dish_3.id}" do
      expect(page).to have_button("remove from chef")
      click_button("remove from chef")
    end

    expect(page).to have_current_path("/chefs/#{@chef.id}")
    expect(page).to_not have_content(@dish_3.name)
  end
end
