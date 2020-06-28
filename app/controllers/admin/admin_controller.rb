class Admin::AdminController < ApplicationController
  before_action :authenticate_admin, only: [:index, :destroy]
  before_action :prevent_logged_in_admin, only: [:new, :create]
  before_action :prohibition_customer, only: [:new]

  def new # ログイン画面
  end

  def index
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @today_order = Order.where(created_at: range)
  end

  def create # ログイン
    @admin = Admin.find_by(email: params[:admin][:email].downcase)
    if @admin && @admin.authenticate(params[:admin][:password])
      log_in @admin
      flash[:notice] = "ログインしました"
      redirect_to admin_path
    else
      flash.now[:danger]  = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render 'new'
    end
  end

  def destroy # ログアウト
    log_out
    redirect_to admin_sign_in_path
  end

  private

  def prevent_logged_in_admin
    if current_admin
      redirect_to admin_path
    end
  end

end
