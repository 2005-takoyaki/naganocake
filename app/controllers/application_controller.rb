class ApplicationController < ActionController::Base

  include Admin::AdminHelper
  include Admin::GenresHelper
  include Admin::CustomersHelper
  include Admin::OrdersHelper

	before_action :configure_permitted_parameters, if: :devise_controller?


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number])
    end


  private

  # 未ログイン管理者を弾く
  def authenticate_admin
    if current_admin == nil
      redirect_to admin_sign_in_path
    end
  end

end
