require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/invoice_items" do
  it "returns the invoice_items belonging to the invoice" do
    invoice       = create(:invoice)
    invoice_item  = create(:invoice_item)
    invoice_item2 = create(:invoice_item, invoice: invoice)
    invoice_item3 = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(parsed_json.count).to eq(2)

    parsed_invoice_item = parsed_json.first
    expect(parsed_invoice_item).to eq(
    "id"                   =>  invoice_item2.id,
    "invoice_id"           =>  invoice_item2.invoice.id,
    "item_id"              =>  invoice_item2.item.id,
    "quantity"             =>  invoice_item2.quantity,
    "unit_price"           =>  "0.01"
    )
  end
end
