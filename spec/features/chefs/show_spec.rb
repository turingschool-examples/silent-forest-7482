require 'rails_helper'

RSpec.describe 'the chef show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Iron Wokman")
    @chef_2 = Chef.create!(name: "Top Cookerman")

    @dish_1 = @chef_1.dishes.create!(name: "Dish_1", description: "Tasty")
    @dish_2 = @chef_1.dishes.create!(name: "Dish_2", description: "Spicy")
    @dish_3 = @chef_2.dishes.create!(name: "Dish_3", description: "Greasy")

    @ingredient_1 = Ingredient.create!(name: "Ingredient_1", calories: 10)
    @ingredient_2 = Ingredient.create!(name: "Ingredient_2", calories: 20)
    @ingredient_3 = Ingredient.create!(name: "Ingredient_3", calories: 15)
    @ingredient_4 = Ingredient.create!(name: "Ingredient_4", calories: 50)

    @ingredient_5 = Ingredient.create!(name: "Ingredient_5", calories: 100)
    @ingredient_6 = Ingredient.create!(name: "Ingredient_5", calories: 200)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)

    DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id)
    DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_6.id)


    visit chef_path(@chef_1)
  end

  it "shows the chef's name" do
    expect(page).to have_content(@chef_1.name)
    expect(page).to_not have_content(@chef_2.name)
  end


  it "displays names and descriptions of that chef's dishes" do
    within "#dishes" do
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@dish_2.name)
      expect(page).to have_content(@dish_2.description)

      expect(page).to_not have_content(@dish_3.name)
      expect(page).to_not have_content(@dish_3.description)
    end
  end

  describe "it lists the name and calories of all ingredients this chef uses in their dishes" do
    it "has a list of unique ingredients that are ordered by calories most to least" do
      within "#ingredients" do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_1.calories)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_2.calories)
        expect(page).to have_content(@ingredient_3.name)
        expect(page).to have_content(@ingredient_3.calories)
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_content(@ingredient_4.calories)

        expect(page).to_not have_content(@ingredient_5.name)
        expect(page).to_not have_content(@ingredient_5.calories)
        expect(page).to_not have_content(@ingredient_6.name)
        expect(page).to_not have_content(@ingredient_6.calories)

        expect(@ingredient_4.name).to appear_before(@ingredient_2.name)
        expect(@ingredient_2.name).to appear_before(@ingredient_3.name)
        expect(@ingredient_3.name).to appear_before(@ingredient_1.name)
      end
    end

    it 'displays a button to delete each dish' do
      expect(page).to have_content("Delete #{@dish_1.name}")
      expect(page).to have_content("Delete #{@dish_2.name}")

      click_on("Delete #{@dish_1.name}")

      expect(page).to have_current_path("/chefs/#{@chef_1.id}")

      expect(page).to_not have_content(@dish_1.name)
      expect(page).to_not have_content(@dish_1.description)
    end
  end


end
