class Admin::AdminController < ApplicationController
  def new
  end

  def index
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

end
