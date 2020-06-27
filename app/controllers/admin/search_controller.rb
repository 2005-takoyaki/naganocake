class Admin::SearchController < ApplicationController
  before_action :authenticate_admin

  def index
    content = params[:search][:content]
    if content.present?
      @products = Product.where('name LIKE ?', "%#{content}%")
      @customers = Customer.where(['last_name || first_name LIKE ? OR kana_last_name || kana_first_name LIKE ?', "%#{content}%", "%#{content}%"])
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
