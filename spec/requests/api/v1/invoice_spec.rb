require "rails_helper"

RSpec.describe "GET /api/v1/invoices" do
  it "returns all invoices" do
    first_invoice = create(:invoice)
    second_invoice = create(:invoice, status: "pending")

    get "/api/v1/invoices"

    expect(parsed_json.count).to eq(2)

    parsed_invoice = parsed_json.first

    expect(parsed_invoice).to eq(
    "id"           => first_invoice.id,
    "customer_id"  => first_invoice.customer.id,
    "merchant_id"  => first_invoice.merchant.id,
    "status"       => first_invoice.status
    )
  end
end

RSpec.describe "GET /api/v1/invoices/:id" do
  it "returns a specific invoice" do
    first_invoice = create(:invoice)
    second_invoice = create(:invoice, status: "pending")

    get "/api/v1/invoices/#{first_invoice.id}"

    expect(parsed_json).to eq(
    "id"           => first_invoice.id,
    "customer_id"  => first_invoice.customer.id,
    "merchant_id"  => first_invoice.merchant.id,
    "status"       => first_invoice.status
    )
  end
end
