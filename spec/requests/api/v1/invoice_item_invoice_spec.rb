require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/invoice" do
  it "returns the associated invoice" do
    invoice_one = create(:invoice)
    invoice_item_one = create(:invoice_item, invoice: invoice_one)
    invoice_two = create(:invoice)
    invoice_item_two = create(:invoice_item, invoice: invoice_two)

    get "/api/v1/invoice_items/#{invoice_item_two.id}/invoice"

    expect(parsed_json).to eq(
    "id"           => invoice_two.id,
    "customer_id"  => invoice_two.customer.id,
    "merchant_id"  => invoice_two.merchant.id,
    "status"       => invoice_two.status
    )
  end
end
