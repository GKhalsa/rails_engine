class Api::V1::ItemsController < Api::ApiController

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find  #fix
    respond_with Item.find_x(item_params)
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    respond_with Item.order("RANDOM()").first
  end

  private

    def item_params
      params.permit(
        :id,
        :name,
        :description,
        :unit_price,
        :merchant_id,
        :created_at,
        :updated_at
      )
    end
end
