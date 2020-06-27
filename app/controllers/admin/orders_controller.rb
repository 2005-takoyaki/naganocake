class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin

  def index
    before_uri = URI.parse(request.referer) # 遷移前のURL取得
    path = Rails.application.routes.recognize_path(before_uri.path) # パスに変換

    if path[:controller] == "admin/customers" # 顧客一覧からきたら顧客の分だけ表示
      @orders = Order.where(customer_id: path[:id]).order(created_at: :desc).page(params[:page]).per(10)
    elsif path[:controller] == "admin/admin" # 管理者ページから来てたら本日の注文数だけ表示
      range = Date.today.beginning_of_day..Date.today.end_of_day
      @orders = Order.where(created_at: range).order(created_at: :desc).page(params[:page]).per(10)
    else # それ以外（ヘッダーから）は全部表示
      @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update # 注文ステータスを更新する
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.order_status == "入金確認" # 注文ステータスが入金確認になれば、製作ステータスも製作待ちに変更
        @order.order_products.update_all(production_status: "製作待ち")
      end
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  def products_update # 製作ステータスを更新する
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    if @order_product.update(order_product_params)
      if @order_product.production_status == "製作中"# 製作ステータスが製作中になれば、注文ステータスも製作中に変更
        @order.update(order_status: "製作中")
      elsif @order_product.production_status == "製作完了"# 製作ステータスが全て製作完了になれば、注文ステータスも発送準備中に変更
        if  @order.order_products.all? { |order_product| order_product.production_status == "製作完了" }
          @order.update(order_status: "発送準備中")
        end
      end
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
