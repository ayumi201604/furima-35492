require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id:@user.id, item_id:@item.id)
  sleep(1)
  end

  context '内容に問題ない場合' do
    it "price,token,postal_code,area_id,municipalitie,address,telephone_number,user_id,item_id,building_nameがあれば保存ができること" do
      expect(@order).to be_valid
    end

    it "building_nameが空でも保存できること" do
      @order.building_name = ''
      expect(@order).to be_valid
    end

    it "telephone_numberがハイフンなしでも保存できること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do

    it "tokenが空では保存ができないこと" do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空では保存ができないこと" do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeがハイフンなしでは保存ができないこと" do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end

    it "area_idが1では登録できない" do
      @order.area_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Area can't be blank")
    end

    it "municipalitieが空では保存ができないこと" do
      @order.municipalitie = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipalitie can't be blank")
    end

    it "addressが空では保存ができないこと" do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "telephone_numberが空では保存ができないこと" do
      @order.telephone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number can't be blank")
    end

    it "telephone_numberが12桁以上では登録できない" do
      @order.telephone_number = 111111111111
      @order.valid?
      expect(@order.errors.full_messages).to include()
    end

    it "telephone_numberが9桁以下では登録できない" do
      @order.telephone_number = 111111111
      @order.valid?
      expect(@order.errors.full_messages).to include()
    end

    it "telephone_numberが半角数字以外が含まれている保存ができないこと" do
      @order.telephone_number = '123456789-g'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is invalid")
    end

    it "user_idが空では保存ができないこと" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では保存ができないこと" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
