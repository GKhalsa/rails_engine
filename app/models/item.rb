class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


    def self.find_x(params)
      params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
      find_by(params)
    end 
end
