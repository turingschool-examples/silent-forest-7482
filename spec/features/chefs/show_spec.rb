require 'rails_helper'

RSpec.describe 'the chef show' do
  before (:each)do
  @chef_1 = Chef.create!(name: "Pat Smith")
  @chef_2 = Chef.create!(name: "Jill Jones")

  @dish_1 = @chef_1.dishs.create!(name: "Coucous", description: "Healthy grain")
  @dish_2 = @chef_1.dishs.create!(name: "Farm Lamb", description: "Savory protein")
  end

  it "shows the chef name" do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
  end

  it "names & descriptions of all the chefs dishes" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_2.description)
  end

  it "name & calories of all ingredients in their dishes" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_2.description)
  end

  it "has button to delete a dish" do
    visit "/chefs/#{@chef.id}"

    click_on("Delete #{@dish_1.name}")

    expect(page).to have_current_path('/chefs')
    expect(page).to_not have_content(@dish_1.name)
  end
end
