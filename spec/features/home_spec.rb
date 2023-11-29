# spec/features/navigation_spec.rb
require 'rails_helper'
require 'jwt'
require 'byebug'

RSpec.feature 'Navigation Page', type: :feature do
  let(:user) { create(:user, role: 'supplier') }
  scenario 'displays the header and navigation links' do
    visit new_user_path
    expect(page).to have_content('Welcome to Our E-Commerce Website')
    expect(page).to have_link('Edit Profile', href: edit_user_path(user))
    expect(page).to have_link('View Profile', href: user_path0(user))

    if user.role == 'supplier'
      expect(page).to have_link('Add Product', href: new_user_product_path(user))
    else
      expect(page).to have_link('View Product', href: user_products_path(user))
    end
  end
end