require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/customer" do
  it "returns the customer associated with the invoice" do
    customer   = create(:customer)
    customer1  = create(:customer)
    invoice    = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(parsed_json).to eq(
    "id"           =>  customer.id,
    "first_name"   =>  customer.first_name,
    "last_name"    =>  customer.last_name
    )
  end
end
