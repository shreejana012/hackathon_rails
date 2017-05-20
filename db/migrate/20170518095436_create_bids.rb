class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.string :amount
      t.integer :item_id
      t.timestamps null: false
    end
    add_index :bids, :user_id
    add_index :bids, :item_id
  end
end
