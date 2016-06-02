class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.top_merchants_by_revenue(quantity)
    quantity = quantity.to_i
    # order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC').limit(quantity)
    # binding.pry
    #go through all merchants and get their invoice_items(multiply quantity by unit price)
    # select( "merchants.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    # binding.pry
    # select("merchants.*", "SUM(invoice_items.)")
    #  .joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: "success"})
    #  .group(:id).order("revenue DESC")
    #  .take(quantity)
  end

  def total_revenue
    invoices.joins(:transactions).where(transactions: {result: "success"}).joins(:invoice_items).sum("quantity * unit_price").to_f/100
  end

  def favorite_customer
    customers.select("customers.*", "COUNT(transactions) AS transaction_count")
    .joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id).order("transaction_count DESC").first
  end

  def customers_with_pending_invoices
    # binding.pry
    customers.joins(invoices: :transactions).where(transactions: {result: "failed"})
  end

end
