class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :shippingcost
  belongs_to_active_hash :user
  has_one_attached :image
end
