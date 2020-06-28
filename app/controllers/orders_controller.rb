class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders # 自分の注文を取得
    @order_products = current_customer.order_products # 自分の注文商品を取得
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
  end

  def new
    @current_carts = Ship.where(customer_id: current_customer.id)
    @order = current_customer.orders.new
    @ship = current_customer.ships.new
  end

  def confirmation_new
    @order = current_customer.orders.new(order_params) # Orderを初期化
    if current_customer.ships.where(customer_id: current_customer.id).present? # もし自分のShipテーブルが存在していたら
      @order_ship = Ship.find(params[:order][:ship][:id]) # Shipテーブルのidを取得
    end
    @order.fare = 800 # 送料
    @ship = current_customer.ships.new(postal_code: params[:order][:ship][:postal_code], address: params[:order][:ship][:address], name: params[:order][:ship][:name])
    render :new unless @ship.valid? if params[:order][:key] == 'new_address'
    @cart_products = current_customer.cart_products
    @order_product = current_customer.orders.new
    total_price = 0
    @cart_products.each do |cart_product|
      product_quantity = cart_product.quantity
      sub_total = product_quantity * cart_product.product.non_taxed_price
      total_price += sub_total
    end
    taxed_total_price = total_price * 1.1
    @order.billing_total = taxed_total_price.floor + 800
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

    if params[:order][:key] == 'new_address'
      ship = current_customer.ships.new
      ship.postal_code = order.postal_code
      ship.address = order.address
      ship.name = order.address_name
      ship.save
    end

    redirect_to complete_orders_path

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :fare, :billing_total, :payment_method, :order_status, :postal_code, :address, :address_name)
  end
end