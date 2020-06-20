module Admin::OrdersHelper

  # 消費税をかける
  def apply_tax(prise)
    price * 1.1
  end
end
