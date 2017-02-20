require 'rails_helper'

feature 'user views points' do
  scenario 'user may view assigned and redeemed points in navbar' do
    user = User.create(name: 'User', email: 'user@test.com', password: 'password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit robots_path

    expect(page).to have_content("Points Available: 10000")
    expect(page).to have_content("Points Redeemed: 0")
  end
end
