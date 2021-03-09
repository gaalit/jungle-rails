require 'rails_helper'

RSpec.feature "Visitor navigates to a specific product page by clicking on the product", type: :feature, js: true do

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

  scenario "They see the specific product's page after clicking on it" do


    # ACT
    visit root_path
    find('.btn-default', match: :first).click
    puts page.html
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product'    
  end
end