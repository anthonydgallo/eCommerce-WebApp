require 'rails_helper'

describe Comment do 
	let(:user){ FactoryGirl.create(:user) }
	let(:product){ Product.create!(name: "race bike")}

	it "is not valid without a product" do
		expect(Comment.new(rating: 3, user: user, body: "Awful bike!")).not_to be_valid
	end

	it "is not valid without a user" do
		expect(Comment.new(rating: 1, body: "Awful bike!", product: product)).not_to be_valid
	end

	it "is not valid without a body" do
		expect(Comment.new(rating: 1, user: user, product: product)).not_to be_valid
	end

	it "is not valid if rating is not integer" do
		expect(Comment.new(rating: "Hello World", user: user, body: "Great bike!", product: product)).not_to be_valid
	end

	it "is a valid comment" do
		expect(Comment.new(rating: 4, user: user, body: "Great bike!", product: product)).to be_valid
	end

 #
end