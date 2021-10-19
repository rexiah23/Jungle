require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    # validation tests/examples here
    before do 
      @new_user = User.new(name: "rexiah_23", email: 'lewis123@gmail.com', password: "123456", password_confirmation: "123456", first_name: 'Lewis', last_name: 'Lee')
    end 

    it "invalid when password and password_confirmation fields don't match" do 
      @new_user.password = 'abc'
      expect(@new_user.valid?).to eq(false)
    end 

    it "invalid when either password and password_confirmation fields are empty" do 
      @new_user.password = nil; 
      expect(@new_user.valid?).to eq(false)
    end 

    it "invalid when email is already in database during sign up" do 
      @new_user.save
      before_count = User.count
      @duplicate_user = User.new(name: "fredlee_23", email: 'lewis123@gmail.com', password: "123", password_confirmation: "123", first_name: 'Fred', last_name: 'Lee')
      @duplicate_user.save
      expect(User.count).to eq(before_count)
    end 

    it "invalid when either email, first name, and last name fields are empty" do 
      @new_user.email = nil; 
      expect(@new_user.valid?).to eq(false)
    end 

    it "invalid when either email, first name, and last name fields are empty" do 
      @new_user.email = nil; 
      expect(@new_user.valid?).to eq(false)
    end 

    it "invalid when the length of password is less than 5" do 
      @new_user.password = 'abcd'
      @new_user.password_confirmation = 'abcd'
      expect(@new_user.valid?).to eq(false)
    end 

    it "invalid when either email, first name, and last name fields are empty" do 
      @new_user.email = nil; 
      expect(@new_user.valid?).to eq(false)
    end
  end 

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before do 
      @new_user = User.new(name: "rexiah_23", email: 'lewis123@gmail.com', password: "123456", password_confirmation: "123456", first_name: 'Lewis', last_name: 'Lee')
      @new_user.save
    end 

    it "authenticates user when correct password and email are entered" do 
      user = User.authenticate_with_credentials('lewis123@gmail.com ', '123456')
      expect(user).to eq(@new_user)
    end

    it "authenticates user when correct password and lower and upper cased email with whitespaces are entered" do 
      user = User.authenticate_with_credentials('  lEwiS123@gmail.com ', '123456')
      expect(user).to eq(@new_user)
    end
  end

end
