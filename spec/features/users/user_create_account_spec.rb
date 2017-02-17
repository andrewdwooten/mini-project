require 'rails_helper'

feature 'user can create an account' do
  scenario 'user submits information and this user is added to database; flash message present' do

    visit new_user_path

    fill_in 'user[name]', with: 'test'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    expect { click_button 'Create Account'}.to change(User, :count).by(1)

    expect(current_path).to eq user_path(User.last)
    expect(page).to have_content "You've created a new account. Shop Around!"
    expect(page).to have_content("Welcome..#{User.last.name}..")
  end

  scenario 'user submits incomplete information and is redirected to the new user page; flash message present' do

    visit new_user_path

    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: ''
    fill_in 'user[password_confirmation]', with: ''

    expect { click_button 'Create Account'}.to change(User, :count).by(0)

    expect(page).to have_content "The user information you've entered is invalid"
    expect(current_path).to eq new_user_path
  end

  scenario 'user already exists and current user is redirected to the new user page; flash message present' do
    User.create(name: 'test', email: 'test@test.com', password_digest: 'password', password_confirmation: 'password')

      visit new_user_path

        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''

        expect { click_button 'Create Account'}.to change(User, :count).by(0)

        expect(page).to have_content "The user information you've entered is invalid"
        expect(current_path).to eq new_user_path
  end
end
