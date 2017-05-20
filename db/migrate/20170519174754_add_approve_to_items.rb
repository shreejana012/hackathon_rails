class AddApproveToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :approve, :boolean, default: false
  end
end
