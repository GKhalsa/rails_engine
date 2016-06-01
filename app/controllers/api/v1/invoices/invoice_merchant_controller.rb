class Api::V1::Invoices::InvoiceMerchantController < Api::ApiController
  def show
    respond_with Invoice.find(params[:id]).merchant
  end
end
