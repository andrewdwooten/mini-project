require 'rails_helper'

feature 'logged in user can browse available robots' do
  scenario 'current_user visits robots page and views all robots' do
    store = User.create(name: 'Admin', email:'admin@test.com', password: 'admin')
    user = User.create(name: 'test', email: 'test@test.com', password: 'password')
    store.robots.create(name: 'frank', location: 'earth', serial_no: '1a2b')
    store.robots.create(name: 'bill', location: 'mercury', serial_no: '1a3b')
    store.robots.create(name: 'dean', location: 'venus', serial_no: '1a4b')


    visit robots_path

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
