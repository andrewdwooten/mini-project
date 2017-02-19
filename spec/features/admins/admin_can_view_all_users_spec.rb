require 'rails_helper'

feature 'admin views all users' do
  scenario 'admin logs in and views all users' do
    admin = User.create(name: 'Andy', email: 'test@test.com', password: 'password', role: 1)
    user = User.create(name: 'frank', email: 'test@test.com', password: 'password')

    visit '/admin/users'

    expect(page).to have_content('Welcome Andy!')
    expect(page).to have_content('frank')
  end
end
