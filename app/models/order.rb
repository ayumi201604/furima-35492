class Order
  include ActiveModel::Model
  attr_accessor :token, :price, :postal_code, :area_id, :municipalitie, :address, :building_name, :telephone_number, :item_user, :user, :item
  validates :token, presence: true
  validates :price, presence: true
  validates :postal_code, presence: true
  validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :municipalitie, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  #validates :item_user, presence: true
  #validates :user, presence: true
  #validates :item, presence: true

  def save
    item_users = ItemUsers.create(item: item, user: user)
    buys = Buys.create(postal_code: postal_code,area_id: area_id,municipalitie: municipalitie,address: address,building_name: building_name,telephone_number: telephone_number,item_user: item_user)
  end
end