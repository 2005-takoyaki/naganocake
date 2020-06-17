class CustomersController < ApplicationController
  def show
    # ログイン機能作成後、current_customerでの処理に変更
    @customer = Customer.first
  end

  def edit
  end

  def update
  end

  def leave
  end

  def lert
  end
end
