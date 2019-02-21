require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
  	it 'ensures email prescence' do
  		user = User.new(password: 'password').save
  		expect(user).to eq(false)
  	end

  	it 'ensures password prescence' do
  		user = User.new(email: 'test@tester.com').save
  		expect(user).to eq(false)
  	end

  	it 'should save successfully' do
  		user = User.new(email: 'test@tester.com', password: 'asdfg').save
  		expect(user).to eq(true)
  	end

  	it 'ensures emails are unique between users' do
       user = User.create!(email: 'test@example.com', password: 'zxdcv')
       expect{ User.create!(email: 'test@example.com', password: 'zxdcv') }.to raise_error('Validation failed: Email has already been taken')
  	end

  	it 'should have a correct email format' do
       expect{ User.create!( email: 'keysmashasldkskj', password: 'qwerty') }.to raise_error('Validation failed: Email is invalid')
     end

    it 'should have many scarves' do
       expect(User.reflect_on_association(:scarves).macro).to eq(:has_many)
    end

  end

  context 'scope tests' do
  end

end
