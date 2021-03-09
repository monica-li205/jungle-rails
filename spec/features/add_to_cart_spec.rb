require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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
  scenario "They can click 'Add to Cart' button and their cart will increase by 1" do
    visit root_path
    first("article.product").find_button('Add').click
    find_link('My Cart (1)').click
    expect(page).to have_content "TOTAL:"
  end
end
