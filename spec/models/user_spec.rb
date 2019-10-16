require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    user = User.create(
      email: 'test@example.com', 
      password: '123456',
      password_confirmation: '123456'
    )      
    expect(user).to be_valid
  end

  it 'is able to authenticate with the database' do
    user = User.create(
       email: 'test@example.com', 
      password: '123456',
      password_confirmation: '123456'
    )
    expect(user.valid_password?('123456')).to be_truthy
  end

  it "is invalid without an email" do 
   user = User.new(email: nil)
   user.valid?
   expect(user.errors[:email]).to include("can't be blank")
  end 

  it "is not valid without a password" do 
   user = User.new(password: nil)
   user.valid?
   expect(user.errors[:password]).to include("can't be blank")
  end 

  it "is invalid with a duplicate email address" do
    User.create(
      email:      "tester@example.com",
      password:   "123456",
    )
    user = User.new(
      email:      "tester@example.com",
      password:   "123456",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
   end

end
