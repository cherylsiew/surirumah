
require 'rails_helper'

feature "User superadmin creates product" do 
  scenario "successfully" do
    visit root_path
    click_on "Log In"
    fill_in "Email", with: "c@c.com"
    fill_in "Password", with: "charlie123"
    click_on "Log In"

    click_on "Add Product"
    fill_in "Category", with: "Furniture"
    fill_in "Product name", with: "Rustic Sofa"
    fill_in "Price in myr", with: "900"
    fill_in "Quantity", with: "4"
    ill_in "Size", with: "W 32 / D 32 / H 15"
    click_on "Submit"

    expect(page).to have_content("Furniture")
  end
end
