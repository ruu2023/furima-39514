class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "は必須項目です。"}
  validates :condition_id, numericality: { other_than: 1 , message: "は必須項目です。"}
  validates :charge_id, numericality: { other_than: 1 , message: "は必須項目です。"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "は必須項目です。"}
  validates :day_id, numericality: { other_than: 1 , message: "は必須項目です。"}
  validates :price, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, allow_blank: true}

  belongs_to :user
  # # has_one :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day
end
