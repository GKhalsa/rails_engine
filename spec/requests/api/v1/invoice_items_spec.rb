require "rails_helper"

RSpec.describe "GET api/v1/invoice_items" do
  it "returns all invoice items" do
    first_invoice_item  = create(:invoice_item)
    second_invoice_item = create(:invoice_item, quantity: 1)

    get "/api/v1/invoice_items"

    expect(parsed_json.count).to eq(2)

    parsed_invoice_item = parsed_json.first

    expect(parsed_invoice_item).to eq(
    "id"          => first_invoice_item.id,
    "item_id"     => first_invoice_item.item.id,
    "invoice_id"  => first_invoice_item.invoice.id,
    "quantity"    => first_invoice_item.quantity,
    "unit_price"  => first_invoice_item.unit_price
    )
  end
end

RSpec.describe "GET api/v1/invoice_items/:id" do
  it "returns a specific invoice item" do
    first_invoice_item  = create(:invoice_item)
    second_invoice_item = create(:invoice_item, quantity: 1)

    get "/api/v1/invoice_items/#{first_invoice_item.id}"

    expect(parsed_json).to eq(
    "id"          => first_invoice_item.id,
    "item_id"     => first_invoice_item.item.id,
    "invoice_id"  => first_invoice_item.invoice.id,
    "quantity"    => first_invoice_item.quantity,
    "unit_price"  => first_invoice_item.unit_price
    )
  end
end
