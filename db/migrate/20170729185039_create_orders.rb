class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t. :product_id
      t.float :total
    end
    add_index :orders, :user_id
  end
end
