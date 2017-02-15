require 'rails_helper'

feature 'user can log in' do
  context 'valid log-in information' do
    scenario 'user logs in and is taken to their user page' do
      User.create(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      visit '/login'

      fill_in 'session[name]', with: 'test'
      fill_in 'session[password]', with: 'password'

      expect { click_button 'Login'}.to change(User, :count).by(0)

      expect(current_path).to eq user_path(User.last)
      expect(page).to have_content("Welcome..#{User.last.name}..")
    end
  end
  context 'invalid log-in information' do
    scenario 'user is redirected to login page after bad password entry' do
      User.create(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      visit '/login'

      fill_in 'session[name]', with: 'test'
      fill_in 'session[password]', with: 'bad_password'

      expect { click_button 'Login'}.to change(User, :count).by(0)

      expect(current_path).to eq('/login')
      expect(page).to have_content('Welcome to Robot World!  Please Login')
    end

    scenario 'user is redirected to login page after bad name entry' do
      User.create(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      visit '/login'

      fill_in 'session[name]', with: 'bad_name'
      fill_in 'session[password]', with: 'password'

      expect { click_button 'Login'}.to change(User, :count).by(0)

      expect(current_path).to eq('/login')
      expect(page).to have_content('Welcome to Robot World!  Please Login')
    end
  end
end
