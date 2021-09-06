require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手く行く時' do
    it 'nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上半角英数字であれば登録できる' do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
    it "first_nameが全角文字であれば登録できる" do
      @user.first_name = "太郎"
      expect(@user).to be_valid
    end
    it "last_nameが全角文字であれば登録できる" do
      @user.last_name = "山田"
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角文字であれば登録できる" do
      @user.first_name_kana = "タロウ"
      expect(@user).to be_valid
    end
    it "last_name_kanaが全角文字であれば登録できる" do
      @user.last_name_kana = "ヤマダ"
      expect(@user).to be_valid
    end
  end

  context '新規登録が上手く行かない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth_day can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    　user = build(:user, encrypted_password: "")
    　user.valid?
    　expect(user.errors[:encrypted_password]).to include("を入力してください","は６文字以上で入力してください")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "00aaa"
      @user.password_confirmation = "000aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)") 
    end
    it "passwordは英数字混合でないと登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください")
    end   
  end
 end
end