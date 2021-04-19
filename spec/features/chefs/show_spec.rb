require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'has the name of the chef' do
    chef = Chef.create(name: "Anthony")
    visit "/chefs/#{chef.id}"
    expect(page).to have_content("#{chef.name}")
  end
  it 'has the names and descriptions of all the chefs dishes'
end