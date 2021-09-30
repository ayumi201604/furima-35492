class OrdersController < ApplicationController
#商品情報の定義（ネストしているので書き方注意）
#ストロングパラメーター内で配送先情報を保存できる記述
#商品の値段の記述
  def index
    @orders = Order.new
  end

  def create
    @orders = Order.new(order_params)
    if @orders.valid?
      Payjp.api_key = "sk_test_4e4e88c72bb8c38b4a28f172" 
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @orders.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

end
