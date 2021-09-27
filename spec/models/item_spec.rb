require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 describe '商品出品登録' do
   context '出品登録できる場合' do
     it "item_nameとdescription、category_idとcondition_id,shipping_cost_id,area_id,delivery_day_id,priceが存在すれば登録できる" do
      expect(@item).to be_valid
    end
  end
 context '商品出品登録できない場合' do
    it "item_nameが空では登録できない" do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "descriptionが空では登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
  
    it "category_idが1では登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "condition_idが1では登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "shipping_cost_idが1では登録できない" do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it "area_idが1では登録できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it "delivery_day_idが1では登録できない" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end
    it 'priceは半角数字以外では登録できない' do
      @item.price = "２２２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円〜9999999円の範囲で設定してください")
    end
    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "priceが300円以下では登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円〜9999999円の範囲で設定してください")
    end
    it "priceが9999999円以上では登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円〜9999999円の範囲で設定してください")
    end
    it "priceが空では登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円〜9999999円の範囲で設定してください")
    end
    it 'userが紐付いていないと出品できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end 
 end
end
