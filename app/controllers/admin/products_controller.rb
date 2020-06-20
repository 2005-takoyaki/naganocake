class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if
    @product.save
    redirect_to '/admin/products'
    else
    render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if
    @product.update(product_params)
    redirect_to '/admin/products/show'
    else
    render :edit
    end
  end
  end

  def destroy
  end


  private

  def product_params
    params.permit(:product).permit( :image_id, :name, :introduction, :non_taxed_price, :has_sold )
  end