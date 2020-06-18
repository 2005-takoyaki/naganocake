class ProductsController < ApplicationController
	# before_action :authenticate_customer!only: [:index,:show]
  def index
  	@products = Product.page(params[:page]).per(8)
  	@genre = Genre.all
  	@products_cnt = Product.count
  	@product_cnt = Genre.group(:product_id).count
  end

  def show
  	@product = Product.find(params[:id])
  end

  def top
  	@product = Product.top
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :image, :non_taxed_price, :has_sold)
  end
end
