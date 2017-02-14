require 'rails_helper'

  describe User, type: :model do
    describe 'validations' do
      context 'invalid attributes' do
        it 'is invalid without a name' do
          user = User.new(password: 'password', email: 'test@test.com')
          expect(user).to be_invalid
        end

        it 'is invalid without a password' do
          user = User.new(name: 'test', email: 'test@test.com')
          expect(user).to be_invalid
        end

        it 'is invalid without an email address' do
          user = User.new(name: 'test', password_digest: 'password', password_confirmation: 'password')
          expect(user).to be_invalid
        end

        it 'has a unique name' do
          User.create(name: 'test', email: 'test@test.com', password_digest: 'password', password_confirmation: 'password')
          user = User.new(name: 'test', email: 'test1@test.com', password_digest: 'password1', password_confirmation: 'password1')
          expect(user).to be_invalid
        end

        it 'has a unique email' do
          User.create(name: 'test', email: 'test@test.com', password_digest: 'password', password_confirmation: 'password')
          user = User.new(name: 'test1', email: 'test@test.com', password_digest: 'password1', password_confirmation: 'password1')
          expect(user).to be_invalid
        end
      end
    end
  end
