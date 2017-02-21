require 'rails_helper'

feature 'user redeems points for robot' do
  scenario 'user purchases a robot' do
    user = User.create(name: 'User', email: 'user@test.com', password: 'password')
    store = User.create(name: 'Admin', email:'admin@test.com', password: 'admin', role: 1)
    store.robots.create(name: 'frank', location: 'earth', serial_no: '1a2b')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit robots_path
    click_button 'Buy Robot'

    expect(current_path).to eq user_path(user)
    expect(page).to have_content('frank')
    expect(page).to have_content('earth')
    expect(page).to have_content('1a2b')
    expect(page).to have_content('Points Available: 9000')
    expect(page).to have_content('Points Redeemed: 1000')
  end
end
