class OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end

  def destroy
  end
	
end