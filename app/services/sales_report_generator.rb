class SalesReportGenerator
  def self.generate_daily_report
    # Agrupar las compras por producto y calcular totales
    ReserveOrPurchase.where(created_at: Date.yesterday.all_day)
                     .includes(:product) # Asegúrate de cargar los productos
                     .group_by(&:product_id)
                     .each do |product_id, purchases|
      product = Product.find_by(id: product_id)
      next unless product # Salta si el producto no existe

      # Usar el campo correcto: unit_price
      total_earnings = purchases.sum { |p| p.desired_quantity * product.unit_price }
      total_quantity = purchases.sum(&:desired_quantity)
      products_sold = purchases.map { |p| "#{product.product_name} (x#{p.desired_quantity})" }.join(", ")

      # Crear el registro en la tabla SalesReport
      SalesReport.create!(
        product_id: product.id,
        report_date: Date.yesterday,
        daily_earnings: total_earnings,
        products_sold_quantity: total_quantity,
        products_sold: products_sold
      )
    end
  end
end