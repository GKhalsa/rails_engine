class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  def self.find_one(params)
    unit_price_check(params)
    find_by(params)
  end

  def self.find_all(params)
    unit_price_check(params)
    where(params)
  end

  def self.random
    order("RANDOM()").first
  end

  def self.unit_price_check(params)
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
  end

end
