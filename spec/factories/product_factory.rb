FactoryGirl.define do
  	sequence(:name, 100) { |n| "Greatest Product Ever#{n}" }

  factory :product do
 		name
    description "Great bike"
    image_url "/"
    color "red"
    price 999.99
	end

end