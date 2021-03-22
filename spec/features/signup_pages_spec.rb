require 'rails_helper'

describe "the user signup process" do
  it "creates a user account" do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', :with => 'test2@email.com'
    fill_in 'Password', :with => 'Password1!'
    fill_in 'Password confirmation', :with => 'Password1!'
    click_on 'Sign Up'
    expect(page).to have_content "You've successfully signed up!"
    expect(page).to have_content 'test2@email.com'
  end
end
