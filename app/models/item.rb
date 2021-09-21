class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :condition_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :shipping_cost_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :delivery_day_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :price, presence: true
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :user
  has_one_attached :image
end
