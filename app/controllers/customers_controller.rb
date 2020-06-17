class CustomersController < ApplicationController
  def show
    # ログイン機能作成後、current_customerでの処理に変更
    @customer = Customer.first
  end

  def edit
    @customer = Customer.first
  end

  def update
    @customer = Customer.first
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render action: :edit_customer
    end
  end

  def leave
  end

  def lert
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:email,:postal_code,:address,:phone_number,:is_valid)
  end
end
