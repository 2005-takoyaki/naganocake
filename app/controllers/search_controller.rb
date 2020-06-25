class SearchController < ApplicationController
  def index
    content = params[:search][:content]
    unless content.blank?
      @products = Product.where('name LIKE ?', "%#{content}%")
      @customers = Customer.where(['last_name LIKE ? OR first_name LIKE ?', "%#{content}%", "%#{content}%"])
    else
      redirect_to root_path
    end
  end
end
