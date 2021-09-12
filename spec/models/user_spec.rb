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
    it 'last_nameが空では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"  
    end
    it 'last_nameが半角文字が含まれていると登録できない' do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください" 
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが半角文字が含まれていると登録できない' do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'last_name_kanaにカタカナ以外の文字(平仮名・漢字・英数字・記号)が含まれていると登録できない' do
      @user.last_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaにカタカナ以外の文字(平仮名・漢字・英数字・記号)が含まれていると登録できない' do
      @user.first_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@がついていない場合登録できない' do
      @user.email = "aaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが英字のみの場合登録できない' do
      @user.password = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'passwordに全角文字が含む場合登録できない' do
      @user.password = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end   
  end
 end
end