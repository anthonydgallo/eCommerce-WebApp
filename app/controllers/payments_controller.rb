class PaymentsController < ApplicationController
	def create
	  product = params[:product_id]
	  token = params[:stripeToken]
	  user = params[:user_id]

	  @product = Product.find(params[:product_id])
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      amount: (@product.price*100).to_i, # amount in cents, again
	      currency: "usd",
	      source: token,
	      description: params[:stripeEmail]
	    )

	if charge.paid
		Order.create(user_id: user, product_id: product, total: @product.price)
  		redirect_to @product, notice: 'Order was successful.'
  	end

	  rescue Stripe::CardError => e
	    # The card has been declined
	  end

	  
	end

end