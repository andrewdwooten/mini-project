require 'rails_helper'

feature 'user can create an account' do
  scenario 'user submits information and this user is added to database' do

    visit new_user_path

    fill_in 'user[name]', with: 'test'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click 'Create User'

    expect(current_path).to eq user_dashboard_path(User.last)
    expect(page).to have_content('Welcome, #{User.last.name}')
  end
end
