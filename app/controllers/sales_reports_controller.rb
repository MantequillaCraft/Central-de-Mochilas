class SalesReportsController < ApplicationController
  def index
    @sales_reports = SalesReport.includes(:product).order(report_date: :desc)
    @sales_reports_today = @sales_reports.where(report_date: Date.today)
    @most_sold_product = SalesReport.joins(:product).joins(:product)
    .group(:product_id)
    .select("product_id, SUM(products_sold_quantity) AS total_quantity, SUM(daily_earnings) AS total_earnings")
    .order(total_quantity: :desc)
    .first
  end

  def generate
    SalesReportGenerator.generate_daily_report
    redirect_to sales_reports_path, notice: "Sales report for today generated successfully!"
  end
end