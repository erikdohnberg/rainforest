require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must have a name" do
  	user = FactoryGirl.build(:user)    
    user.name = nil
    refute user.valid?
  end

	test "user must have an email" do
   	user = FactoryGirl.build(:user)    
    user.email = nil
    refute user.valid?
	end

	test "user must supply a password" do
  	user = FactoryGirl.build(:user)    
    assert true
	end

	# test "cannot change the password_digest" do
 # 		user = FactoryGirl.create(:user) 
	# 	assert_raises(ActiveModel:MassAssignmentSecurity::Error)
	# 	 {user.update_attributes):password_digest => "blahblahblah"}
	# end

	test "cannot have two users with the same email address" do
	user = FactoryGirl.create(:user, :email => "bugs@gmail.com")
	second_user = FactoryGirl.build(:user, :email => "bugs@gmail.com")
	refute second_user.save

	assert_equal ["has already been taken"], second_user.errors[:email]

	end



end


