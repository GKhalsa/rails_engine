class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.select("merchants.*", "COUNT(transactions) AS transaction_count")
    .joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id).order("transaction_count DESC").first
  end

end
