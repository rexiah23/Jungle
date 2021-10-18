require 'rails_helper'

RSpec.describe User, type: :model do
 
describe 'Validations' do
  # validation tests/examples here
  before do 
    @category = Category.new(:name => "Shirts")
    @product = Product.new(:name => "Men's shirts", :price_cents => 5000, :quantity => 2, :category => @category)
  end 

  it "it must have a name to be valid" do 
    @product.name = nil; 
    @product.save
    expect(@product.errors.full_messages).to include "Name can't be blank"
  end 
end
