require 'rails_helper'

RSpec.feature "Visitor clicks on the add to cart button for a specific product and the cart icon on the nav bar updates by 1", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the cart icon increase by when when Add to cart is clicked" do


    # ACT
    visit root_path
    find('.btn-primary', match: :first).click
    puts page.html
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end
end