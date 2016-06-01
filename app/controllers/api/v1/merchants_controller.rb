class Api::V1::MerchantsController < Api::ApiController

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    binding.pry
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    binding.pry
    respond_with Merchant.where(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
