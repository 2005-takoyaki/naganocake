class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id) #一覧表示するためにorderモデルの情報を全て習得する。
    @order_products = OrderProduct.where(order_id: @orders)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
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
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :fare, :billing_total, :payment_method, :order_status, :postal_code, :address, :address_name)
  end

  def ship_params
    params.require(:order).permit(ship: [:customer_id, :name, :postal_code, :address])
  end

end