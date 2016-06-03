require "rails_helper"

RSpec.describe "GET /api/v1/merchants/most_revenue?quantity=x" do
  it "returns highest grossing merchants by quantity" do
    merchant_one   =  create(:merchant)
          invoice  =  create(:invoice, merchant: merchant_one)
            item   =  create(:item)
    invoice_item   =  create(:invoice_item, item: item, invoice: invoice)
    merchant_two   =  create(:merchant)
    merchant_three =  create(:merchant)

    get "/api/v1/merchants/most_revenue?quantity=#{1}"

    expect(parsed_json.count).to eq(1)
    expect(parsed_json.first).to eq(
    "id"    =>  merchant_one.id,
    "name"  =>  merchant_one.name
    )
  end
end
