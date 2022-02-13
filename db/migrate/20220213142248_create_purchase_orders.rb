class CreatePurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_orders, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.date :date

      t.timestamps
    end
  end
end
