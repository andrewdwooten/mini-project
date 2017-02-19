require 'rails_helper'

feature 'admin can delete robots' do
  scenario 'admin deletes robot and it is not present on index' do
    admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    robot = admin.robots.create(name: 'Test', location: 'home', serial_no: '123')

    visit admin_robots_path

    expect { click_link 'Delete Robot'}.to change(Robot, :count).by(-1)

    expect(current_path).to eq admin_robots_path
    expect(page).to_not have_content('Test')
    expect(page).to_not have_content('home')
    expect(page).to_not have_content('123')
  end
end
