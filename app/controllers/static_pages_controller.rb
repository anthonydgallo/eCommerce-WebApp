class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def landing_page
  	if Product.first
  		@featured_product = Product.first
  		@products = Product.all
  	end
  end
end
