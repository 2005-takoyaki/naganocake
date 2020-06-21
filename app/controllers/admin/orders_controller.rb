class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update # 注文ステータスを更新する
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.order_status == "入金確認" # 注文ステータスが入金確認になれば、製作ステータスも製作待ちに変更
        @order.order_products.update_all(production_status: 1)
      end
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  def products_update # 製作ステータスを更新する
    @order_product = OrderProduct.find(params[:id])
    if @order_product.update(order_product_params)
      redirect_to admin_order_path(@order_product.order_id)
    else
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end
end
