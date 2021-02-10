require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should create a user' do
      @user = User.create(
        email: "123@123.com",
        first_name: "bob",
        last_name: "barker",
        password: "123456",
        password_confirmation: "123456"
        )
      expect(@user).to be_valid
    end

it 'should fail to log in if password is less than 6 characters' do
@user = User.create(
  email: "123@123.com",
  first_name: "bob",
  last_name: "barker",
  password: "123",
  password_confirmation: "123"
  )
  expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
end

it 'should fail to log in if password confirmation is incorrect' do
  @user = User.create(
    email: "123@123.com",
    first_name: "bob",
    last_name: "barker",
    password: "123456",
    password_confirmation: "1234567"
    )
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
end

it '3 should not save without unique email' do
    user = User.create(
      email: "123@123.com",
      first_name: "bob",
      last_name: "barker",

      password_digest:"123456"
      )
    user2 = User.create(
      email: "123@123.com",
      first_name: "bert",
      last_name: "brackenrack",

      password_digest:"1234567"
      )
    expect(user2).to_not be_valid
    end
  end

describe '.authenticate_with_credentials' do
  it 'it should not authenticate if email or password is wrong' do
  user = User.create(
  email: '123@123.com',
  first_name: "bob",
  last_name: "barker",

  password: "123456",
  password_confirmation: "123456"
  )

  authenticate = User.authenticate_with_credentials(user.email, user.password)
  expect(authenticate).to_not be_valid
  end
end

  

end
