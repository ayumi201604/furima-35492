class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :condition_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :shipping_cost_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :delivery_day_id, numericality: { other_than: 1 ,message: "can't be blank"}, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300円〜9999999円の範囲で設定してください" }
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :shipping_cost
  belongs_to :user
  has_one :item_user
  has_one_attached :image
end
