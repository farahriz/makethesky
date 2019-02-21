require 'rails_helper'

RSpec.describe "sign up process", type: :request do
  describe "Sign up a new user" do

    it "signs up a new user" do
      visit '/signup'
      within("form") do
      	fill_in 'user[email]', with: 'example@morexample.com'
      	fill_in 'user[password]', with: 'asdsasdad'
      	fill_in 'user[password_confirmation]', with: 'asdsasdad'
      end

      click_button 'Create User'
      expect(page).to have_content 'User was successfully created'

    end

  end
end
