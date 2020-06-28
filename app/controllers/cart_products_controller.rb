class CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def add
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
    if @cart_product&.product_id.nil?
      @cart_product = current_cart.cart_products.build(cart_product_params)
      @cart_product.save
      redirect_to cart_products_path
    else
      @cart_product.quantity += params[:cart_product][:quantity].to_i
      @cart_product.save
      redirect_to cart_products_path
    end
  end

  def index
    @cart_products = current_cart.cart_products
    @total_price = 0
    @cart_products.each do |cart_product|
      product_quantity = cart_product.quantity
      sub_total = product_quantity * cart_product.product.non_taxed_price
      @total_price += sub_total
    end
    @total_price *= 1.1
  end

  def destroy
    cart_product = current_cart.cart_products.find_by(product_id: params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    cart_products = current_cart.cart_products
    cart_products.each do |cart_product|
      cart_product.destroy
    end
    redirect_to cart_products_path
  end

  def update
    @cart_product = current_cart.cart_products.find_by(product_id: params[:id])
    @cart_product.update(cart_product_params)
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id,:quantity,:customer_id)
  end

end
