class User < ApplicationRecord
  validates :nickname, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :item_users
  belongs_to :user
  belongs_to :item
  has_one :buy
  has_one :item_user
  belongs_to :user
  belongs_to :item_user
end
