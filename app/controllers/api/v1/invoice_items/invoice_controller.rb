class Api::V1::InvoiceItems::InvoiceController < Api::ApiController

  def show
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end
