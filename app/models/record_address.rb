class RecordAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :post_code, :prefecture_id, :municipalities, :block, :apartment, :telephone, :record
end