class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  def self.find_x(params)
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
    find_by(params)
  end

  def self.find_all(params)
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
    where(params)
  end

  def self.random
    order("RANDOM()").first
  end

end
