require 'rails_helper'

describe 'chef show page' do
  context 'when you land on the page' do
    before {
      @chef = Chef.create!(name: "George")
      @dish_1 = Dish.create!(name: "dish_1", description: 'this is dish 1', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: "dish_2", description: 'this is dish 2', chef_id: @chef.id)

      visit chef_path(@chef)
    }

    it 'shows you the name of the chef' do
      expect(page).to have_content("George")
    end

    it "shows all of the names and descriptions of the chef's dishes" do
      expect(page).to have_content("dish_1")
      expect(page).to have_content("this is dish 1")
      expect(page).to have_content("dish_2")
      expect(page).to have_content("this is dish 2")
    end

    it 'when you click remove dish for dish_1' do
      expect(page).to have_content("dish_1")
      within ".dish-#{@dish_1.id}" do
        click_on "remove dish"
      end
      expect(page).to_not have_content("dish_1")
      expect(Dish.find(@dish_1.id)).to eq(@dish_1)
    end
  end

  context 'you look at the ingredients section' do
    before {
      @chef = Chef.create!(name: "George")

      @dish_1 = Dish.create!(name: "dish_1", description: 'this is dish 1', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: "dish_2", description: 'this is dish 2', chef_id: @chef.id)

      @ingredient_1 = Ingredient.create!(name: "ingredient_1", calories: 10)
      @ingredient_2 = Ingredient.create!(name: "ingredient_2", calories: 20)

      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_2.ingredients << @ingredient_1

      visit chef_path(@chef)
    }

    it 'shows the name and calories for all ingredients' do
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_1.calories)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_2.calories)
    end

    it 'shows all the ingredients are unique' do
      expect(page).to have_css("div.ingredient", :count => 2)
    end

    it 'shows all the ingredients are ordered by calories desc' do
      expect(@ingredient_2.name).to appear_before(@ingredient_1.name)
    end
  end

  context 'you look at the most popular ingredients section' do
    before {
      @chef = Chef.create!(name: "George")

      @dish_1 = Dish.create!(name: "dish_1", description: 'this is dish 1', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: "dish_2", description: 'this is dish 2', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: "dish_3", description: 'this is dish 3', chef_id: @chef.id)

      @ingredient_1 = Ingredient.create!(name: "ingredient_1", calories: 10)
      @ingredient_2 = Ingredient.create!(name: "ingredient_2", calories: 20)
      @ingredient_3 = Ingredient.create!(name: "ingredient_3", calories: 30)
      @ingredient_4 = Ingredient.create!(name: "ingredient_4", calories: 40)

      @dish_1.ingredients << @ingredient_1

      @dish_2.ingredients << @ingredient_1
      @dish_2.ingredients << @ingredient_2

      @dish_3.ingredients << @ingredient_1
      @dish_3.ingredients << @ingredient_2
      @dish_3.ingredients << @ingredient_3

      @dish_4.ingredients << @ingredient_1
      @dish_4.ingredients << @ingredient_2
      @dish_4.ingredients << @ingredient_3
      @dish_4.ingredients << @ingredient_4


      visit chef_path(@chef)
    }

    it 'shows only the top 3 dishes' do
      within '.most-popular-ingredients' do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_2.name)
        expect(page).to have_content(@dish_3.name)
        expect(page).to_not have_content(@dish_4.name)
      end
    end

    it 'shows the dishes ordered by popularity of usage' do
      within '.most-popular-ingredients' do
        expect(@dish_1.name).to appear_before(@dish_2.name)
        expect(@dish_2.name).to appear_before(@dish_3.name)
      end
    end
  end
end