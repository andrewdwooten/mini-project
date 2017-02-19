require 'rails_helper'

  feature 'admin can create a robot' do
    scenario 'admin creates a robot' do
      admin = User.create(name: 'Andy', email: 'admin@test.com', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
      visit new_admin_robot_path(admin)

      fill_in "quantity", with: 10

      expect { click_button 'Generate Robots'}.to change(Robot, :count).by(10)

      expect(current_path).to eq admin_robots_path
    end
  end
