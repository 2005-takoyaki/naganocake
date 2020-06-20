class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def update
  end

  def products_update
  end
end
