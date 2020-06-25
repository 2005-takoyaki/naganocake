class Admin::SearchController < ApplicationController
  before_action :authenticate_admin

  def index
    content = params[:search][:content]
    unless content.blank?
      @products = Product.where('name LIKE ?', "%#{content}%")
      @customers = Customer.where(['last_name LIKE ? OR first_name LIKE ? OR kana_last_name LIKE ? OR kana_first_name LIKE ?', "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%"])
    else
      redirect_to root_path
    end
  end
end
