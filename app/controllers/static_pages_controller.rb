class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def landing_page
  	if Product.first
  		@featured_product = Product.first
  		@products = Product.all
    else
      @products = nil
  	end
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
