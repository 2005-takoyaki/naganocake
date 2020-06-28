class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin

  def index
    products = Product.includes(:genre).where(genres: {is_valid: "true"})
    @products= Kaminari.paginate_array(products).page(params[:page])
  end

  def new
    @product = Product.new
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
    #binding.pry
      @product.save
      redirect_to admin_product_path(@product)
    else
      @error = @product.errors.full_messages
      if @error.include?("ジャンルを入力してください")
        @error.delete("ジャンルを入力してください")
      end
    # if @error.include?("Genreを入力してください")
    # @error.delete("Genreを入力してください")
    # @error.push("ジャンルを入力してください")
    # @error_class = 1
      render :new
    #end
    end
  end

  def update
    @product = Product.find(params[:id])
    if
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
    else
    @error = @product.errors.full_messages
    if @error.include?("ジャンルを入力してください")
       @error.delete("ジャンルを入力してください")
    end
    render :edit
    end
  end
  end

  def destroy
  end


  private

  def product_params
    params.require(:product).permit( :image, :name, :introduction, :non_taxed_price, :has_sold, :genre_id, :genre_name, :is_valid )
  end