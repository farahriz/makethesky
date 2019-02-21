require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "user should save" do
		assert User.new(email: 'test@tester.com', password: 'string').save		
	end

end
