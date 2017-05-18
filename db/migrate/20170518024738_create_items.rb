class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :user_id
      t.string :title
      t.text :description
      t.string :painter
      t.string :initial_price
      t.string :shipping_charges
      t.string :photo
      t.timestamps null: false
    end
    add_index :items, :user_id
  end
end
