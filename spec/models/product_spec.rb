require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

  #test when all properties are present
  it 'is able to save when all 4 properties are included' do
    @category = Category.new
    @product = Product.new({
      name: 'Test_product', 
      price: 33, 
      quantity: 3, 
      category: @category})
    expect(@product).to be_valid
  end
  
  #test when name is not given
  it 'is not able to save when name property is not included' do
    @category = Category.new
    @product = Product.new({
      price: 33, 
      quantity: 3, 
      category: @category})
    expect(@product).to_not be_valid
    expect(@product.errors.messages).to eq ({:name=>["can't be blank"]})
  end

  #test when price is not given
  it 'is not able to save when price property is not included' do
    @category = Category.new
    @product = Product.new({
      name: 'Test_product',
      quantity: 3,
      category: @category
    })
    expect(@product).to_not be_valid
    expect(@product.errors.messages).to eq({:price=>["is not a number", "can't be blank"], :price_cents=>["is not a number"]})
  end

  #test when quantity is not given
  it 'is not able to save when quantity property is not included' do
    @category = Category.new
    @product = Product.new({
      name: 'Test_product',
      price: 33,
      category: @category
    })
    expect(@product).to_not be_valid
    expect(@product.errors.messages).to eq({:quantity=>["can't be blank"]})
  end

  #test when category is not given
  it 'is not able to save when catefory property is not included' do
    @category = Category.new
    @product = Product.new({
      name: 'Test_product',
      price: 33,
      quantity: 3,
    })
    expect(@product).to_not be_valid
    expect(@product.errors.messages).to eq({:category=>["can't be blank"]})
  end

end
end
