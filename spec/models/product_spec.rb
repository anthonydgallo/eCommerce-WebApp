require 'rails_helper'

describe Product do 

	let(:product){ Product.create!(name: "race bike",price: 999.99)}
	let(:user){ User.create!(email: "Test@test.com", password: "TestPasword123")}

	before do
	  product.comments.create!(rating: 1, user: user, body: "Awful bike!")
	  product.comments.create!(rating: 3, user: user, body: "Ok bike!")
	  product.comments.create!(rating: 5, user: user, body: "Great bike!")
	end

	it "returns the average rating of all comments" do
		expect(product.average_rating).to eq 3
	end

	it "is not valid without a name" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end

	it "returns the comment with the highest rating" do
		expect(product.highest_rating_comment).to eq product.comments.rating_desc.first
	end

	it "searches and returns products using name like correctly" do
		expect(Product.search("bike")).to eq Product.where("name LIKE '%bike%'")
	end

 # 
end