require "rails_helper"

RSpec.describe "GET /api/v1/items/:id/invoice_items" do
  it "returns invoice items belonging to the item" do
    item = create(:item)
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item, item: item)
    invoice_item3 = create(:invoice_item, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(parsed_json.count).to eq(2)

    parsed_invoice_item = parsed_json.first

    expect(parsed_invoice_item).to eq(
    "id"               =>  invoice_item2.id,
    "item_id"          =>  invoice_item2.item.id,
    "invoice_id"       =>  invoice_item2.invoice.id,
    "quantity"         =>  invoice_item2.quantity,
    "unit_price"       =>  invoice_item2.unit_price
    )
  end
end
