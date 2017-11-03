require 'rails_helper'

describe ProductsController, type: :controller do
	let(:product){ FactoryGirl.create(:product) }
	let(:user){ FactoryGirl.create(:admin) }
	#let(:product_bad){FactoryGirl.create(:product_bad)}
	let(:product_bad) { FactoryGirl.build(:product, name: 1, price: "two") }

	context 'GET #index' do
		it 'renders the index template' do
			get :index
			expect(response).to be_ok
			expect(response).to render_template('index')
		end
		it 'renders the searchtemplate' do
			get :index, params: {q: "test"}
			expect(response).to be_ok
			expect(response).to render_template('index')
		end
	end

	context 'GET #Show' do
		it 'renders the show template' do
 		 	get :show, params: { id: product.id } 

			expect(response).to be_ok
			expect(response).to render_template('show')
		end
	end

	context 'GET #New' do
		before do
			sign_in user
		end 
		it 'renders the new template' do
			get :new
			expect(response).to be_ok
			expect(response).to render_template('new')
		end
	end

	context 'GET #Edit' do
		before do
			sign_in user
		end 
		it 'renders the edit template' do
			get :edit, params: { id: product.id } 
			expect(response).to be_ok
			expect(response).to render_template('edit')
		end
	end

	context 'Post #Create' do
		before do
			sign_in user
		end 
		productdetails = FactoryGirl.attributes_for(:product)

		it 'creates a product' do
			post :create, params: {product:productdetails}
			expect(response).to redirect_to(Product.last)
		end

		it 'cannot create a new product with invalid attributes' do
		  badProductDetails = FactoryGirl.attributes_for(:product_bad)
          post :create, params: {product:badProductDetails}, format: :json
          expect(response.status).to eq(422)
        end


	end

	context 'Post #Update' do
		before do
			sign_in user
		end 
		productdetails = FactoryGirl.attributes_for(:product)
		it 'updates a product' do
			#Creates test product, then attempts update on that product
			post :create, params: {product:productdetails}
			post :update, params: {id: Product.last.id, product:productdetails} 
			expect(response).to redirect_to(Product.last)
		end

		it 'cannot update a product with invalid attributes' do
		  #Creates test product, then attempts update on that product
		  #post :create, params: {product:productdetails}
		  #productdetails = FactoryGirl.attributes_for(:product)

        @badProduct = FactoryGirl.create(:product)
        @updated_attributes = { :price => "Yes"}
      	put :update, params:{id: @badProduct.id, product: @updated_attributes}
      	expect(response).to render_template('edit')

		  #badProductDetails = FactoryGirl.attributes_for(:product_bad)
    	  #put :update, params: {id: Product.last.id, product:badProductDetails}, format: :json
     	  
          #post :update, params: {id: Product.last.id, product:badProductDetails}, format: :json
          #expect(response).to render_template('edit')
        end

	end

	context 'Post #Destroy' do
		before do
			sign_in user
		end 
		productdetails = FactoryGirl.attributes_for(:product)
		it 'Destroys a product' do
			#Creates test product, then attempts to destroy that product
			post :create, params: {product:productdetails}
			post :destroy, params: {id: Product.last.id} 
			expect(response).to redirect_to(products_url)
		end
	end

end