require 'rails_helper'
require 'byebug'
RSpec.feature 'New Product Page', type: :feature do
    let(:user) { create(:user, role: 'supplier') }
    # let(:product) {create(:product)}
    it 'displays the new product form' do
      visit new_user_product_path(user)
      expect(page).to have_content('New Product')
      expect(page).to have_field('Name', type: 'text')
      expect(page).to have_field('Description', type: 'textarea')
      expect(page).to have_field('Price', type: 'number')
      expect(page).to have_selector('label[for="product_product_image"]')
      expect(page).to have_field('product[product_image]', visible: :all)
      expect(page).to have_button('Create Product')

      fill_in "product_name", with: "Sample Product"
      fill_in 'Description', with: 'This is a sample product description.'
      fill_in 'Price', with: 1999
      attach_file('product_product_image', Rails.root.join('/home/dell/Downloads/painting.jpg'))
      click_button 'Create Product'
      expect(page).to have_content('Sample Product')


  end
end
