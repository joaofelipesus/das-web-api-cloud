class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items, id: :uuid do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :purchase_order, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
