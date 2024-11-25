# Crear proveedores
supplier1 = Supplier.find_or_create_by!(
  supplier_name: "Mochilas Premium",
  supplier_phone: "123-456-7890",
  supplier_address: "123 Calle Principal"
)

supplier2 = Supplier.find_or_create_by!(
  supplier_name: "Distribuidora Escolar",
  supplier_phone: "987-654-3210",
  supplier_address: "456 Avenida Secundaria"
)

# Crear productos
product1 = Product.find_or_create_by!(product_name: "Mochila Escolar") do |product|
  product.product_type = "Escolar"
  product.quantity_available = 50
  product.unit_price = 350.00
  product.supplier_id = supplier1.id
end

product2 = Product.find_or_create_by!(product_name: "Mochila Deportiva") do |product|
  product.product_type = "Deportiva"
  product.quantity_available = 30
  product.unit_price = 500.00
  product.supplier_id = supplier2.id
end

product3 = Product.find_or_create_by!(product_name: "Mochila de Montaña") do |product|
  product.product_type = "Montaña"
  product.quantity_available = 20
  product.unit_price = 1200.00
  product.supplier_id = supplier1.id
end

# Crear usuarios
admin = User.find_or_create_by!(username: "admin") do |user|
  user.password = "adminpassword"
  user.password_confirmation = "adminpassword"
end

vendedor = User.find_or_create_by!(username: "vendedor") do |user|
  user.password = "vendedorpassword"
  user.password_confirmation = "vendedorpassword"
end

# Crear clientes
customer1 = Customer.find_or_create_by!(customer_name: admin.username)
customer2 = Customer.find_or_create_by!(customer_name: "Juan Pérez")
customer3 = Customer.find_or_create_by!(customer_name: "María López")

# Crear transacciones de reservas o compras
ReserveOrPurchase.find_or_create_by!(
  desired_quantity: 2,
  payment_method: "Tarjeta de Crédito",
  product_id: product1.id,
  customer_id: customer1.id
)

ReserveOrPurchase.find_or_create_by!(
  desired_quantity: 1,
  payment_method: "Efectivo",
  product_id: product2.id,
  customer_id: customer2.id
)

# Crear reporte de ventas
SalesReport.find_or_create_by!(
  product_id: product1.id,
  daily_earnings: 700.00,
  products_sold_quantity: 2,
  products_sold: "Mochila Escolar x2",
  report_date: Date.today
)