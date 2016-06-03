class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.finder(params)
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
    find_by(params)
  end

  def self.ranked_by_revenue(quantity)
    quantity = quantity.to_s
    joins(:invoice_items)
    .order("SUM(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id).limit(quantity)
  end
end
