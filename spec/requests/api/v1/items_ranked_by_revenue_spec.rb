require "rails_helper"

RSpec.describe "GET /api/v1/items/most_revenue?quantity=x" do
  it "returns highest grossing items by revenue" do
        merchant   =  create(:merchant)
            item   =  create(:item, name: "what", merchant: merchant)
           item2   =  create(:item)
         invoice   =  create(:invoice, merchant: merchant)
    invoice_item   =  create(:invoice_item, item: item, invoice: invoice)

    get "/api/v1/items/most_revenue?quantity=#{1}"

    expect(parsed_json.count).to eq(1)

    expect(parsed_json.first).to eq(
    "id"          =>  item.id,
    "name"        =>  item.name,
    "description" => item.description,
    "unit_price"  => "0.01",
    "merchant_id" => merchant.id
    )
  end
end
