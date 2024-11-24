class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_type
      t.integer :quantity_available
      t.float :unit_price

      t.timestamps
    end
  end
end
