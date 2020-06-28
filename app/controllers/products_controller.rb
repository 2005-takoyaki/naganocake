class ProductsController < ApplicationController
  
  def index
    @genres = Genre.where(genres: {is_valid: "true"})
     products = Product.includes(:genre).where(genres: {is_valid: "true"}).where(has_sold: "true")
    @products = Kaminari.paginate_array(products).page(params[:page]).per(8)
    # urlにgenre_id(params)がある場合
    if params[:genre_id]
      # Genreのデータベースのテーブルから一致するidを取得
      genre = Genre.find(params[:genre_id])
      # genre_idと紐づく商品を取得
      products = genre.products.order(created_at: :desc).where(has_sold: "true")
      @products = Kaminari.paginate_array(products).page(params[:page]).per(8)
      @products_cnt = Product.count
    else
      # 投稿すべてを取得
      @products_cnt = Product.count
      products = Product.includes(:genre).where(genres: {is_valid: "true"}).where(has_sold: "true")
      @products = Kaminari.paginate_array(products).page(params[:page]).per(8)
    end

  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    @genres = Genre.where(genres: {is_valid: "true"})
  end

  def top
    @genres = Genre.where(genres: {is_valid: "true"})
    @products = Product.page(params[:page]).per(4).where(has_sold: "true")
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :image, :non_taxed_price, :has_sold)
  end

end