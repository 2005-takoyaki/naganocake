class CartProductsController < ApplicationController
  def add
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
    if @cart_product&.product_id.nil?
      @cart_product = current_cart.cart_products.build(cart_product_params)
      @cart_product.save
      redirect_to cart_products_path
    else
      redirect_to cart_products_path
    end
  end

  def index
    @cart_products = current_cart.cart_products
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
      binding.pry
    end
    redirect_to cart_products_path
  end

  def update
    @cart_product = current_cart.cart_products.find_by(product_id: params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id,:quantity,:customer_id)
  end

end
