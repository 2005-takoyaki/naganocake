module Admin::OrdersHelper

  # 消費税をかける
  def tax(price)
    (price * 1.1).round # 四捨五入
  end

  # 送料
  def shipping_fee
    800
  end
end
