class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :block, :apartment, :telephone, :record_id, :item_id, :user_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: :invalid }
    validates :municipalities
    validates :block
    validates :telephone, format: { with: /\A[0-9]{10,11}\z/, message: :invalid }
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: :other_than }

  def save
    # 寄付情報を保存し、変数donationに代入する
    record = Record.create(user_id:, item_id:)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code:, prefecture_id:, municipalities:, block:,
                   apartment:, telephone:, record_id: record.id)
  end
end
