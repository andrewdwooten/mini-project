require 'rails_helper'

feature 'user visits show page' do
  scenario 'user sees all their robots' do
    user = User.create(name: 'test', email: 'test@test.com', password: 'password')
    user.robots.create(name: 'frank', location: 'earth', serial_no: '1a2b')
    user.robots.create(name: 'bill', location: 'mercury', serial_no: '1a3b')
    user.robots.create(name: 'dean', location: 'venus', serial_no: '1a4b')

  end
end
