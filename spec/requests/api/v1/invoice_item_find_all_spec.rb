require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find_all?parameters" do
  it "returns all instances of invoice item" do
    invoice_item = create(:invoice_item)
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find_all?unit_price=0.01"

    expect(parsed_json.count).to eq(2)
    expect(parsed_json.last).to eq(
    "id"         => invoice_item.id,
    "invoice_id" => invoice_item.invoice.id,
    "item_id"    => invoice_item.item.id,
    "quantity"   => invoice_item.quantity,
    "unit_price" => "0.01"
    )
  end
end
