
require 'rails_helper'

RSpec.feature 'Main Page', type: :feature do
  scenario 'displays the welcome message and buttons' do
    visit root_path
    expect(page).to have_content('Welcome to Our E-Commerce Website')
    expect(page).to have_link('Sign Up', href: 'users/new')
    expect(page).to have_link('Sign In', href: 'users/sign_in') 
  end
end
