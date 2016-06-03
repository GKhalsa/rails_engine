require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/items" do
  it "returns the items belonging to the invoice" do
    invoice       = create(:invoice)
    item1         = create(:item)
    invoice_item  = create(:invoice_item, invoice: invoice, item: item1)
    item2         = create(:item, name: "hellooo")
    invoice_item  = create(:invoice_item, invoice: invoice, item: item2)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(parsed_json.count).to eq(2)

    parsed_item = parsed_json.first
    expect(parsed_item).to eq(
    "id"             =>  item1.id,
    "name"           =>  item1.name,
    "description"    =>  item1.description,
    "unit_price"     =>  "0.01",
    "merchant_id"    =>  item1.merchant.id
    )
  end
end
