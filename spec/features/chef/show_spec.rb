require 'rails_helper'

RSpec.describe 'the chef show' do
  before(:each) do
    @chef = Chef.create!(name: 'Mike Piz')

    @dish_1 = @chef.dishes.create!(name: 'ravioli', description: 'chef boy rds')
    @dish_2 = @chef.dishes.create!(name: 'poptart', description: 'toaster ready and yummy')
    @dish_3 = @chef.dishes.create!(name: 'ribeye steak', description: 'expensive, lovely, and fresh')
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
end
