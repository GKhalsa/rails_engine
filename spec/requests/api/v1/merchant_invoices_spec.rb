require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/invoices" do
  it "returns all invoices associated to that merchant" do
    merchant_one  = create(:merchant)
    invoice       = create(:invoice)
    invoice_two   = create(:invoice, status: "hello", merchant: merchant_one)
    invoice_three = create(:invoice, status: "goodbye", merchant: merchant_one)

    get "/api/v1/merchants/#{merchant_one.id}/invoices"

    expect(parsed_json.count).to eq(2)

    parsed_invoice = parsed_json.first

    expect(parsed_invoice).to eq(
    "id"                   =>  invoice_two.id,
    "customer_id"          =>  invoice_two.customer.id,
    "merchant_id"          =>  invoice_two.merchant.id,
    "status"               =>  invoice_two.status
    )
  end
end
