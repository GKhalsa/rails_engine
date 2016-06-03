class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions,  through: :invoices
  has_many :customers,     through: :invoices

  def self.top_merchants_by_revenue(quantity)
    quantity = quantity.to_i
    joins(:invoice_items)
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .group(:id).limit(quantity)
  end

  def total_revenue
    revenue = invoices.joins(:transactions)
    .where(transactions: {result: "success"})
    .joins(:invoice_items).sum("quantity * unit_price")
    {"revenue" => "#{revenue./100.00}"}
  end

  def favorite_customer
    customers.select("customers.*", "COUNT(transactions) AS transaction_count")
    .joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id).order("transaction_count DESC").first
  end

  def customers_with_pending_invoices
    invoices.joins(:transactions)
    .where(transactions: {result: "failed"})
    .joins(:customer).uniq
  end

end
