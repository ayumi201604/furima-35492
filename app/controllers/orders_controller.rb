class OrdersController < ApplicationController

  def index
    @orders = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @orders = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @orders.valid?
      Payjp.api_key = "sk_test_4e4e88c72bb8c38b4a28f172" 
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
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
    params.require(:order).permit(:price,:postal_code,:area_id,:municipalitie,:address,:building_name,:telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

end
