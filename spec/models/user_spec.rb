require 'rails_helper'

RSpec.describe User, type: :model do
 
    #test when all fields are present
    it 'is able to save when all input fiels are valid' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
      password_confirmation: 'password'})
      expect(@user).to be_valid
    end
  
    it 'is does not save when passwords do not match' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
        password_confirmation: 'passwor'})
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to eq ({:password_confirmation => ["doesn't match Password"]})
    end

    it 'is does not save if password confirmation not given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password'})
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to eq ({:password_confirmation => ["can't be blank"]})
    end

    it 'is does not save when first name not given' do
      @user = User.new({
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
        password_confirmation: 'password'})
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to eq ({:first_name => ["can't be blank"]})
    end

    it 'is does not save when last name not given' do
      @user = User.new({
        first_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
        password_confirmation: 'password'})
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to eq ({:last_name => ["can't be blank"]})
    end

    it 'is does not save when email not given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'})
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to eq ({:email => ["can't be blank"]})
    end

    it 'is does not save if the password is less than 6 characters' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com',
        password: 'pass',
        password_confirmation: 'pass'})
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to eq ({:password => ["is too short (minimum is 6 characters)"]})
    end
 
      describe '.authenticate_with_credentials' do
      it 'logs user in if the right email/password combination has been given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
      password_confirmation: 'password'
      })
      @user.save
      @user2 = User.authenticate_with_credentials('john@geemail.com', 'password')
      expect(@user).to eq(@user2)
    end

    it 'does not log user in if the wrong password has been given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
      password_confirmation: 'password'
      })
      @user.save
      @user2 = User.authenticate_with_credentials('john@geemail.com', 'passworde')
      expect(@user).to_not be == @user2
    end
    it 'does not log user in if the wrong password has been given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
      password_confirmation: 'password'
      })
      @user.save
      @user2 = User.authenticate_with_credentials('johney@geemail.com', 'password')
      expect(@user).to_not be == @user2
    end

    it 'logs user in even if an email with spaces before and after has been given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
      password_confirmation: 'password'
      })
      @user.save
      @user2 = User.authenticate_with_credentials(' john@geemail.com ', 'password')
      expect(@user).to be == @user2
    end

    it 'logs user in even if an email with the wrong cases has been given' do
      @user = User.new({
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@geemail.com', 
        password: 'password',
      password_confirmation: 'password'
      })
      @user.save
      @user2 = User.authenticate_with_credentials(' jOhN@geemail.com ', 'password')
      expect(@user).to be == @user2
    end


    
  end

end
