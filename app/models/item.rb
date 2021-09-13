class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :shippingcost
  belongs_to :user
  has_one_attached :image
end
