class Api::V1::Invoices::CustomerController < Api::ApiController
  def show
    respond_with Invoice.find(params[:id]).customer
  end
end
