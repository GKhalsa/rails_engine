require "rails_helper"

RSpec.describe "GET /api/v1//:id/merchant" do
  it "returns the merchant associated with the item" do
    merchant  = create(:merchant)
    merchant2 = create(:merchant, name: "hello")
    item      = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(parsed_json).to eq(
    "id"     =>  merchant.id,
    "name"   =>  merchant.name
    )
  end
end
