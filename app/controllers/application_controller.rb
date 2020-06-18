class ApplicationController < ActionController::Base

  include Admin::AdminHelper
	include Admin::GenresHelper
  include Admin::CustomersHelper


  private

  # 未ログイン管理者を弾く
  def authenticate_admin
    if current_admin == nil
      redirect_to admin_sign_in_path
    end
  end

end
