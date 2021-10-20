require 'rails_helper'

RSpec.feature "Visitor adds a product to cart from the home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      ) 
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    find("button[class='btn btn-primary']").trigger('click')
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_text 'My Cart (1)'
  end

end