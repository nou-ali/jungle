require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can navigate to the product page from the home page and click the add button to add 1 to the cart" do
    # ACT
    visit root_path
    click_button('Add', match: :first)

    # # DEBUG
   

    # VERIFY
    expect(page).to have_css'#navbar', text: 'My Cart (1)'
    save_screenshot('cart_page.png')
   
  end
end