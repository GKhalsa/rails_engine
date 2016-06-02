class Api::V1::Merchants::RevenueController < Api::ApiController
  def show
    respond_with Merchant.find(params[:id]).total_revenue
  end
end
