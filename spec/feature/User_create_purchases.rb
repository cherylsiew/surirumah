require 'rails_helper'

feature "User superadmin creates product" do 
  scenario "successfully" do
    visit root_path
    click_on "Log In"
    fill_in "Email", with: "b@b.com"
    fill_in "Password", with: "ben123"
    click_on "Log In"

    click_on "Add To Cart"
    fill_in "Quantity", with: "5"
    click_on "Buy Now"


    expect(page).to have_content("5")
  end
end