require 'rails_helper'

feature 'admin views all users' do
  scenario 'admin logs in and views all users' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    user = User.create(name: 'frank', email: 'user@test.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_users_path

    expect(page).to have_content('Welcome Andy!')
    expect(page).to have_content('frank')
  end

  scenario 'user cannot view admin users page ' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    user = User.create(name: 'frank', email: 'user@test.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_users_path

    expect(page).to have_content('(404)')
    expect(page).to_not have_content('Welcome Andy!')
    expect(page).to_not have_content('frank')

  end
end
