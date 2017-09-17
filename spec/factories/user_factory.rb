FactoryGirl.define do
  	sequence(:email) { |n| "user#{n}@example.com" }
   	sequence(:password) { |n| "ABCdd#{n}@!!" }

  	factory :user do
 		email 
    	password
    	first_name "Peter"
    	last_name "Example"
    	admin false
	end

 	factory :admin, class: User do
  		email "peter2@example.com"
  		password "qwertyuiop"
  		admin true
  		first_name "Admin"
  		last_name "User"
	end

end