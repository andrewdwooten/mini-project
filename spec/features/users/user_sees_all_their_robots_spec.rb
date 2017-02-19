require 'rails_helper'

feature 'user visits show page' do
  scenario 'user sees all their robots' do
    user = User.create(name: 'test', email: 'test@test.com', password: 'password')
    user.robots.create(name: 'frank', location: 'earth', serial_no: '1a2b')
    user.robots.create(name: 'bill', location: 'mercury', serial_no: '1a3b')
    user.robots.create(name: 'dean', location: 'venus', serial_no: '1a4b')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content('frank')
    expect(page).to have_content('earth')
    expect(page).to have_content('1a2b')
    expect(page).to have_content('bill')
    expect(page).to have_content('mercury')
    expect(page).to have_content('1a3b')
    expect(page).to have_content('dean')
    expect(page).to have_content('1a4b')
    expect(page).to have_content('venus')
  end
end
