class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
     else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user != @item.user || @item.item_user.present?
      redirect_to root_path
     else
      render :edit
    end
  end

  def update
   if @item.update(item_params)
      redirect_to item_path(@item.id) 
     else
      render :edit
   end
 end

  def destroy
   if @item.destroy
      redirect_to root_path
     else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_cost_id, :area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
