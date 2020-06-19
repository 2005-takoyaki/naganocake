class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number])
    end

	include Admin::GenresHelper

  include Admin::CustomersHelper

  def current_cart
    if session[:cart_id]  # 1
      @cart = Customer.find(session[:cart_id])  # 顧客1
    else
      # @cart = CartProduct.create(customer_id: current_customer.id)
      CartProduct.create(customer_id: current_customer.id)
      session[:cart_id] = current_customer.id
    end
  end


end
