class Api::V1::Invoices::InvoiceTransactionsController < Api::ApiController
  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
