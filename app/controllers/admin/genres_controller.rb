class Admin::GenresController < ApplicationController
#before_action :login_required

  def index
  	@genres = Genre.all #一覧表示するためにGenreモデルの情報を全て習得する。
    @genre = Genre.new #新規作成するために空のモデルを作成する。
  end

  def edit
    @genre = Genre.find(params[:id])#idを習得して編集ページを表示する
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  def create
    # ストロングパラメーターを使用
    @genre = Genre.new(genre_params)
    if
    # DBへ保存する
    @genre.save
    # 一覧画面へリダイレクト
    redirect_to '/admin/genres'
    else
    @genres = Genre.all
    render :index
    end
  end
end

  private

  def genre_params
    params.require(:genre).permit(:genre_name, :is_valid)
  end

  def current_admin
  Admin.find_by(params[:id])
  end


  def login_required
   redirect_to top_products_path unless current_admin
  end
