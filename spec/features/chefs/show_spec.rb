require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create!(name: 'Linguine')
    @dish1 = @chef.dishes.create!(name: 'Omelete', description: 'made with real eggs')
    @dish2 = @chef.dishes.create!(name: 'Ratatouille', description: 'like in the movie')
    @ingr1 = Ingredient.create!(name: 'egg', calories: 100)
    @ingr2 = Ingredient.create!(name: 'onion', calories: 70)
    @ingr3 = Ingredient.create!(name: 'bell pepper', calories: 65)

    DishIngredient.create!(dish: @dish1, ingredient: @ingr1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingr2)
    DishIngredient.create!(dish: @dish2, ingredient: @ingr2)
    DishIngredient.create!(dish: @dish2, ingredient: @ingr3)
    
    visit "/chefs/#{@chef.id}"
  end

  context 'you are on the chef show page' do
    it 'you see the name of the chef' do
      expect(page).to have_content(@chef.name)
    end

    it 'you see the names & descriptions of all dishes belonging to the chef' do
      within '#dishes' do
        expect(page).to have_content(@dish1.name)
        expect(page).to have_content(@dish2.name)
  
        expect(page).to have_content(@dish1.description)
        expect(page).to have_content(@dish2.description)
      end
    end

    it 'you see the distinct names and calories of all ingredients used by the chef' do
      within '#ingredients' do
        expect(page).to have_content(@ingr1.name)
        expect(page).to have_content(@ingr2.name, count: 1)
        expect(page).to have_content(@ingr3.name)
        
        expect(page).to have_content(@ingr1.calories)
        expect(page).to have_content(@ingr2.calories, count: 1)
        expect(page).to have_content(@ingr3.calories)
      end
    end

    context 'you can remove a dish using the delete button' do
      it 'dishes have a delete button next to them' do
        within '#Omelete' do
          expect(page).to have_button('Delete')
        end
      end

      it 'clicking delete button removes dish from page' do
        within '#Omelete' do
          click_on 'Delete'
        end
        
        expect(current_path).to eq("/chefs/#{@chef.id}")
        expect(page).to_not have_content(@dish1.name)
      end
    end
  end
end