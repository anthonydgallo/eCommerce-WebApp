require 'rails_helper'

describe UsersController, type: :controller do 
	let(:user){ User.create!(email: "Test@test.com", password: "TestPasword123")}
	let(:user2){ User.create!(email: "Test2@test.com", password: "TestPasword123")}
	
	describe 'GET #show' do

		context "when a user is logged in" do
			before do
				sign_in user
			end 

			it 'loads correct user details' do
				get :show, params: { id: user.id } 
				expect(response).to be_ok
				expect(assigns(:user)).to eq user
			end

			it 'redirects to root_path when accessing  other user page' do
				get :show, params: { id: user2.id }
				expect(response).to redirect_to(root_path)
			end

			it 'returns 302 when accessing other user page' do
				get :show, params: { id: user2.id }
				expect(response.response_code).to eq 302
			end


		end

		context "when a user is not logged in" do
			it 'redirects to login' do
			get :show, params: { id: user.id }
			expect(response).to redirect_to(new_user_session_path)
			end
		end




	end

end