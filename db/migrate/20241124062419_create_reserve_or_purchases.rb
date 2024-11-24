class CreateReserveOrPurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :reserve_or_purchases do |t|
      t.integer :desired_quantity
      t.string :payment_method
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
