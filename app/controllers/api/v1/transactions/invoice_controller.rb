class Api::V1::Transactions::InvoiceController < Api::ApiController
  def show
    respond_with Transaction.find(params[:id]).invoice
  end
end
