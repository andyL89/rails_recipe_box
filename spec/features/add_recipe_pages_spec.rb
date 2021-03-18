require 'rails_helper'

describe "the add recipe process" do
  it "adds a new recipe" do
    visit recipes_path
    click_link 'Create a Recipe'
    fill_in 'Title', :with => 'Fabulous Fruit on a Stick'
    click_on 'Create Recipe'
    expect(page).to have_content 'Recipe added!'
    expect(page).to have_content 'Fabulous Fruit On A Stick'
  end
end