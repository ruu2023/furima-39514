class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string    :post_code,   null: false
      t.integer :prefecture_id,    null: false
      t.string :municipalities,    null: false
      t.string :block,    null: false
      t.string :apartment
      t.string :telephone,    null: false
      t.references :record,    null:false, foreign_key:true
      t.timestamps
    end
  end
end
