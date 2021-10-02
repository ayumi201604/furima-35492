class Order
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :municipalitie, :address, :building_name, :telephone_number, :user_id, :item_id
  with_options presence: true do
   validates :token
   validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid" }
   validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}
   validates :municipalitie
   validates :address
   validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
   validates :telephone_number, format: { with: /\A[0-9]+\z/ }
   validates :telephone_number, numericality: { only_integer: true,length: { in: 10..11 }, message: "is invalid" }
   validates :user_id
   validates :item_id
  end
  def save
    item_users = ItemUser.create(item_id: item_id, user_id: user_id)
    buys = Buy.create(postal_code: postal_code,area_id: area_id,municipalitie: municipalitie,address: address,building_name: building_name,telephone_number: telephone_number,item_user_id: item_users.id)
  end
end