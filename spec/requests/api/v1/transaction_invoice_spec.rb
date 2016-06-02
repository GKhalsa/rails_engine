require "rails_helper"

RSpec.describe "GET /api/v1/transactions/:id/invoice" do
  it "returns the associated invoice" do
    invoice_one = create(:invoice)
    invoice_two = create(:invoice, status: "denied")
    transaction = create(:transaction, invoice: invoice_one)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(parsed_json).to eq(
    "id"           => invoice_one.id,
    "customer_id"  => invoice_one.customer.id,
    "merchant_id"  => invoice_one.merchant.id,
    "status"       => invoice_one.status
    )
  end
end
