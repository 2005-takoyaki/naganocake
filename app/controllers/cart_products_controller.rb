class CartProductsController < ApplicationController
  def add
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
    if @cart_product.blank?
      @cart_product = current_cart.cart_products.build(cart_product_params)
    end
    @cart_product.quantity += params[:quantity].to_i
    @cart_product.save
    redirect_to root_path
  end

  def index
    @cart_products = current_cart.cart_products
  end

  def destroy
  end

  def destroy_all
  end

  def update
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id)
  end
end
