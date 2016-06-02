require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/item" do
  it "returns the associated invoice" do
    item_one = create(:item)
    invoice_item_one = create(:invoice_item, item: item_one)
    item_two = create(:item)
    invoice_item_two = create(:invoice_item, item: item_two)

    get "/api/v1/invoice_items/#{invoice_item_two.id}/item"

    expect(parsed_json).to eq(
    "id"           => item_two.id,
    "name"         => item_two.name,
    "description"  => item_two.description,
    "unit_price"   => item_two.unit_price,
    "merchant_id"  => item_two.merchant.id
    )
  end
end
