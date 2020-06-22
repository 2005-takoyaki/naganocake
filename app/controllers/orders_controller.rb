class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find_by(id: current_customer.id)
    @order_products = OrderProduct.where(order_id: @order.id)
  end

  def new
    @order = current_customer.orders.new
    @ship = current_customer.ships.new
  end

  def confirmation
    @order = current_customer.orders.new(order_params)
    @order_ship = Ship.find(params[:order][:ship][:id])
    @ship = current_customer.ships.new(postal_code: params[:order][:ship][:postal_code], address: params[:order][:ship][:address], name: params[:order][:ship][:name])
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @order_products = current_customer.order_products.all
      @order_products.each do |order_product|
        @order_products = @order.order_products.new
        @order_products.order_id = order_product.order.id
        @order_products.product_id = order_product.product.id

        @order_products.number = 
        @order_products.price = 

        @order_products.quantity = order_product.quantity

        @order_products.save 
      end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :fare, :billing_total, :payment_method, :order_status, :postal_code, :address, :address_name)
  end

  def ship_params
    params.require(:order).permit(ship: [:customer_id, :name, :postal_code, :address])
  end
end