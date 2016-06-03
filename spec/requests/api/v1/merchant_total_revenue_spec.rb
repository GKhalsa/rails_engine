require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/revenue" do
  it "returns total revenue for merchant" do
    merchant_one   =  create(:merchant)
            item   =  create(:item)
         invoice   =  create(:invoice, merchant: merchant_one)
    invoice_item   =  create(:invoice_item, item: item, invoice: invoice)
     transaction   =  create(:transaction, invoice: invoice, result: "failed")
     transaction   =  create(:transaction, invoice: invoice)
    get "/api/v1/merchants/#{merchant_one.id}/revenue"


    expect(parsed_json).to eq(
      "revenue"=>"0.01"
    )
  end
end
