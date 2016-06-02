require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/invoices" do
  it "returns invoices belonging to the customer" do
    customer = create(:customer)
    invoice1 = create(:invoice)
    invoice2 = create(:invoice, customer: customer)
    invoice3 = create(:invoice, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(parsed_json.count).to eq(2)

    parsed_invoice = parsed_json.first

    expect(parsed_invoice).to eq(
    "id"           =>  invoice2.id,
    "customer_id"  =>  invoice2.customer.id,
    "merchant_id"  =>  invoice2.merchant.id,
    "status"       =>  invoice2.status
    )
  end
end
