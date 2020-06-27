class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  include Admin::GenresHelper
  include Admin::AdminHelper
  include Admin::GenresHelper
  include Admin::CustomersHelper
  include Admin::ProductsHelper

	before_action :configure_permitted_parameters, if: :devise_controller?


  include Admin::OrdersHelper

	before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number])
    end

  private

  def current_cart
    if session[:cart_id]
      @cart = Customer.find(session[:cart_id])
    else
      @cart = current_customer
      session[:cart_id] = @cart.id
      @cart
    end
  end

  # 未ログイン管理者を弾く
  def authenticate_admin
    if current_admin == nil
      redirect_to admin_sign_in_path
    end
  end

  #ログイン管理者を弾く
  def prohibition_admin
    if current_admin
      redirect_to admin_path
    end
  end


end
