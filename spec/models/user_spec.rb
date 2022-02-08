require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

          it 'should save new user when all fields are present' do
            @user = User.new(first_name: 'Noura', last_name:'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password')
            @user.save
            expect(@user).to be_valid
          end


    it 'validates first name' do
      @user = User.new(first_name: nil, last_name:'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user).not_to be_valid 
      expect(@user.errors.full_messages[0]).to include("First name can't be blank")
      
    end

    it 'validates last name' do
      @user = User.new(first_name: 'Noura', last_name:nil, email: '123@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user).not_to be_valid 
      expect(@user.errors.full_messages[0]).to include("Last name can't be blank")
      
    end

    it 'validates password details' do
      @user = User.new(first_name: 'Noura', last_name:nil, email: '123@gmail.com', password: nil, password_confirmation: nil)
      expect(@user).not_to be_valid 
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      
    end

    it 'should validate password and password confirmation fields match' do
      @user = User.new(first_name: 'Noura', last_name: 'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password123')
      expect(@user).not_to be_valid 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      
    end

    it 'User Validations save emails that are unique' do
      @user1 = User.new(first_name: 'Noura', last_name:'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password')
      @user1.save
      
      @user2 = User.new(first_name: 'Noura', last_name:'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user2).not_to be_valid   
    end

    it 'should validate users with a space that has spaces before of efter email' do
      @user = User.new(first_name: 'Noura', last_name:'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save

      @user = User.authenticate_with_credentials(' 123@gmail.com ','password')
      expect(@user).to be == @user
      
    end

    it 'should validate users with a wrong case for email' do
      @user = User.new(first_name: 'Noura', last_name:'Ahmed', email: '123@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save

      @user = User.authenticate_with_credentials(' 123@gmail.COM ','password')
      expect(@user).to be == @user
      
    end
          
          


  end

end

    
