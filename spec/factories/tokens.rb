require 'faker'

FactoryGirl.define do	
  factory :token do
	token { Faker::Lorem.words(1).join('') }
	timevalid 10
	user_id 1

	  factory :invalid_token do
	    token nil
	  end
	end
end