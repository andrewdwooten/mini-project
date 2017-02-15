require 'rails_helper'

feature 'user pages are secure from other users' do
  scenario 'a user can only view their user page' do
    user1 = User.create(name: 'andy', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    user2 = User.create(name: 'frank', email: 'test2@test.com', password: 'password', password_confirmation: 'password')

    visit '/login'
    fill_in 'session[name]', with: 'andy'
    fill_in 'session[password]', with: 'password'
    click_button 'Login'

    expect(current_path).to eq user_path(user1)
    expect(page).to have_content("Welcome..andy..")
    expect(page).to_not have_content("Welcome..frank..")

    visit user_path(user2) 
    expect(page).to have_content("Welcome..andy..")
    expect(page).to_not have_content("Welcome..frank..")

  end
end
