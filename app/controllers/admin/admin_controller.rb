class Admin::AdminController < ApplicationController
  before_action :authenticate_admin, only: [:index, :destroy]

  def new
  end

  def index
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @today_order = Order.where(created_at: range)
  end

  def create
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

  def destroy
    log_out
    redirect_to admin_sign_in_path
  end

  private

  # 未ログイン管理者を弾く
  def authenticate_admin
    if current_admin == nil
      redirect_to admin_sign_in_path
    end
  end

end
