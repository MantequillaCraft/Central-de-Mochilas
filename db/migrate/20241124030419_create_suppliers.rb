class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :supplier_phone
      t.string :supplier_address

      t.timestamps
    end
  end
end
