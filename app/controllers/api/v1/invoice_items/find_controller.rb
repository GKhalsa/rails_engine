class Api::V1::InvoiceItems::FindController < Api::ApiController
  def show
    respond_with InvoiceItem.find_one(invoice_item_params)
  end

  def index
    respond_with InvoiceItem.find_all(invoice_item_params)
  end

  private

    def invoice_item_params
      params.permit(
        :id,
        :item_id,
        :invoice_id,
        :quantity,
        :unit_price,
        :created_at,
        :updated_at
       )
    end
end
