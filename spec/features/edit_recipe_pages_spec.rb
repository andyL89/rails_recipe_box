require 'rails_helper'

describe "the edit recipe process" do
  it "edits an existing recipe" do
    recipe = Recipe.new({title: 'Fabulous Fruit on a Stick'})
    recipe.save
    visit recipe_path(recipe)
    click_link 'Edit'
    fill_in 'Instructions', :with => 'Skewer fruit with stick'
    click_on 'Update Recipe'
    expect(page).to have_content 'Recipe updated!'
  end
end