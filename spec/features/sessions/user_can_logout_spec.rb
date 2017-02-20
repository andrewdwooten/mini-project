require 'rails_helper'

feature 'user can logout' do
  scenario 'user logs in and is able to log out terminating session' do
    User.create(name: 'test', email: 'test@test.com', password: 'password')

    visit login_path

    fill_in 'session[name]', with: 'test'
    fill_in 'session[password]', with: 'password'
    click_button 'Login'
    click_link 'Logout'

    expect(current_path).to eq login_path
    expect(page).to have_content("Thanks for visiting.  Come back soon!")
  end
end
