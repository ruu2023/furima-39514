class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :block, :apartment, :telephone, :record_id, :item_id, :user_id

  with_options presence: true do
    validates :block
    validates :municipalities
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid."}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    # 寄付情報を保存し、変数donationに代入する
    record = Record.create(user_id: user_id, item_id: item_id)
    binding.pry
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, block: block, apartment: apartment, telephone: telephone, record_id: record.id)
  end
end