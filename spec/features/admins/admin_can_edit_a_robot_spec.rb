require 'rails_helper'

feature 'admin can edit a robot' do
  scenario 'admin visits robot edit page and updates info' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    robot = admin.robots.create(name: 'Test', location: 'home', serial_no: '123')

    visit admin_robots_path
    click_link 'Update Robot'

    expect(current_path).to eq '/admin/robots/1/edit'

    fill_in 'name', with: 'edit_name'
    fill_in 'location', with: 'edit_location'
    fill_in 'serial_no', with: 'edit_serial_no'
    click_button 'Update Robot'

    expect(current_path).to eq admin_robots_path
    expect(page).to have_content('edit_name')
    expect(page).to have_content('edit_location')
    expect(page).to have_content('edit_serial_no')
    expect(page).to_not have_content('test')
    expect(page).to_not have_content('home')
    expect(page).to_not have_content('123')
  end
end
