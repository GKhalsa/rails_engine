require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/merchant" do
  it "returns the customer associated with the invoice" do
    merchant   = create(:merchant)
    merchant1  = create(:merchant)
    invoice    = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(parsed_json).to eq(
    "id"      =>  merchant.id,
    "name"    =>  merchant.name
    )
  end
end
