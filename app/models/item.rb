class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true
  belongs_to :user
  # has_one :record

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
