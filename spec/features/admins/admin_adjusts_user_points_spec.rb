require 'rails_helper'

feature 'admin adjusts user points' do
  scenario 'admin adds points to user' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content('Assigned Points: 10000')
    expect(page).to have_content('Redeemed Points: 0')

    fill_in 'points_adjustment', with: 50000
    click_button 'Adjust Points'

    expect(current_path).to eq admin_users_path
    expect(page).to have_content('Assigned Points: 60000')
    expect(page).to have_content('Redeemed Points: 0')
  end

  scenario 'admin removes points from user' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content('Assigned Points: 10000')
    expect(page).to have_content('Redeemed Points: 0')

    fill_in 'points_adjustment', with: -10000
    click_button 'Adjust Points'

    expect(current_path).to eq admin_users_path
    expect(page).to have_content('Assigned Points: 0')
    expect(page).to have_content('Redeemed Points: 0')
  end
end
