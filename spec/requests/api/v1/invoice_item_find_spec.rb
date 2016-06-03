require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find?parameters" do
  it "returns an instance of invoice items" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=0.01"

    expect(parsed_json).to eq(
    "id"         => invoice_item.id,
    "invoice_id" => invoice_item.invoice.id,
    "item_id"    => invoice_item.item.id,
    "quantity"   => invoice_item.quantity,
    "unit_price" => "0.01"
    )
  end
end
