class CreateSalesReports < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_reports do |t|
      t.references :product, null: false, foreign_key: true
      t.float :daily_earnings
      t.integer :products_sold_quantity
      t.text :products_sold
      t.date :report_date

      t.timestamps
    end
  end
end
