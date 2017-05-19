class AddBudgetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :budget, :integer
  end
end
