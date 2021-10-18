require 'rails_helper'

RSpec.describe UserSpec, type: :model do
  describe "Validations" do 
    it "returns error if password and password_confirmation do not match" do 
      @password = User.new 
      puts @password.inspect
    end 
  end 
end
