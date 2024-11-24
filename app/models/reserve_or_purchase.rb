class ReserveOrPurchase < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  ##callback :
  ##despues de crear, ejecuta create_sales_report
  after_create :create_sales_report


  private
  def create_sales_report
    # Crear un nuevo registro en SalesReport para este producto y la fecha actual
    SalesReport.create!(
      product_id: product_id,
      report_date: Date.current,
      daily_earnings: product.unit_price * desired_quantity,
      products_sold_quantity: desired_quantity,
      products_sold: "#{product.product_name} (x#{desired_quantity})"
    )
  end
end
