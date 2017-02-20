require 'rails_helper'

feature 'admin creates a user' do
  scenario 'admin is logged in and creates a user' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_user_path

    fill_in 'name', with: 'test'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    expect { click_button 'Create New User'}.to change(User, :count).by(1)

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content('test')
    expect(page).to have_content('test@test.com')
    expect(page).to have_content('User generated')
  end
end
