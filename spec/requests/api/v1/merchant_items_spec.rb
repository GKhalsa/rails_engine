require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/items" do
  it "returns all items associated to that merchant" do
    merchant_one = create(:merchant)
    item       = create(:item)
    item_two   = create(:item, name: "hello", merchant: merchant_one)
    item_three = create(:item, name: "goodbye", merchant: merchant_one)

    get "/api/v1/merchants/#{merchant_one.id}/items"

    expect(parsed_json.count).to eq(2)

    parsed_item = parsed_json.first

    expect(parsed_item).to eq(
    "id"            =>  item_two.id,
    "name"          =>  item_two.name,
    "description"   =>  item_two.description,
    "unit_price"    =>  item_two.unit_price,
    "merchant_id"   =>  item_two.merchant.id
    )
  end
end
