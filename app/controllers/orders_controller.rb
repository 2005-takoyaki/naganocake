class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
    @order_products = current_customer.order_products
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
  end

  def new
    @order = current_customer.orders.new
    @ship = current_customer.ships.new
  end

  def confirmation_new
    @order = current_customer.orders.new(order_params)
    @order_ship = Ship.find(params[:order][:ship][:id])
    @ship = current_customer.ships.new(postal_code: params[:order][:ship][:postal_code], address: params[:order][:ship][:address], name: params[:order][:ship][:name])
    @cart_products = current_customer.cart_products
    @order_product = current_customer.orders.new
  end

  def complete
  end

  def create
    order = current_customer.orders.new(order_params)
    order.fare = 800
    total_price = 0
    cart_products = current_customer.cart_products
    cart_products.each do |cart_product|
      product_quantity = cart_product.quantity
      sub_total = product_quantity * cart_product.product.non_taxed_price
      total_price += sub_total
    end
    taxed_total_price = total_price * 1.1
    order.billing_total = taxed_total_price.floor + 800
    order.order_status = 0
    order.save
    cart_products.each do |cart_product|
      order_products = order.order_products.new
      order_products.product_id = cart_product.product_id
      order_products.number = cart_product.quantity
      order_products.taxed_price = cart_product.product.non_taxed_price * 1.1
      order_products.production_status = 0
      order_products.save
      cart_product.destroy
    end

    redirect_to orders_path

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :fare, :billing_total, :payment_method, :order_status, :postal_code, :address, :address_name)
  end

  def ship_params
    params.require(:order).permit(ship: [:customer_id, :name, :postal_code, :address])
  end

end