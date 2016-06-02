class Api::V1::Merchants::MostRevenueController < Api::ApiController

  def index
    respond_with Merchant.top_merchants_by_revenue(params["quantity"])
  end

end
