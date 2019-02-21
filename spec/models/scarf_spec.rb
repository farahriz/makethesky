require 'rails_helper'

RSpec.describe Scarf, type: :model do
  context "validation tests" do 
    user = User.first
    city = City.first

    it 'creates a new scarf without title' do
      expect{ Scarf.create!(user_id: user.id, description: 'Lorem Ipsum', city_id: city.id, weather_insp: 'humidity', date_insp: Date.today) }.to raise_error('Validation failed: Title can\'t be blank')
    end

    it 'creates a new scarf without a user' do
      expect{ Scarf.create!(title: 'Lorem Ipsrum', description: 'Lorem Ipsum', city_id: city.id, weather_insp: 'humidity', date_insp: Date.today) }.to raise_error('Validation failed: User must exist, User can\'t be blank')
    end

    it 'creates a new scarf without a city' do
      expect{ Scarf.create!(user_id: user.id, description: 'Lorem Ipsum', title: 'Lorem Ipsrum', weather_insp: 'humidity', date_insp: Date.today) }.to raise_error('Validation failed: City must exist, City can\'t be blank')
    end

    it 'creates a new scarf without date_insp' do
      expect{ Scarf.create!(user_id: user.id, description: 'Lorem Ipsum', city_id: city.id, weather_insp: 'humidity', title: 'Lorem Ipsrum') }.to raise_error('Validation failed: Date insp can\'t be blank')
    end

    it 'creates a new scarf without weather_insp' do
      expect{ Scarf.create!(user_id: user.id, description: 'Lorem Ipsum', city_id: city.id, date_insp: Date.today, title: 'Lorem Ipsrum') }.to raise_error('Validation failed: Weather insp can\'t be blank')
    end

  end

  context "association tests" do

    it 'should belong to user' do
      expect(Scarf.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

  end


  context "custom model class method tests" do
    user = User.first
    city = City.first
    let(:scarf) { Scarf.create!(user_id: user.id, description: 'Lorem Ipsum', city_id: city.id, date_insp: Date.today, title: 'Lorem Ipsrum', weather_insp: 'humidity') }

    it 'should say a scarf that was just created has not been changed' do
      expect(scarf.has_changed?).to be(false)
    end

    it 'should say an updated scarf has been changed' do
      scarf.update(description: "Laura Ipsome")
      expect(scarf.has_changed?).to be(true)      

    end

  end

end
