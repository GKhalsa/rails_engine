require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/favorite_merchant" do
  it "returns merchant whith whome the customer has transacted with the most" do
    merchant_one   =  create(:merchant)
    merchant_two   =  create(:merchant, name:"sunny")
        customer   =  create(:customer)
            item   =  create(:item)
         invoice   =  create(:invoice, merchant: merchant_two, customer: customer)
    invoice_item   =  create(:invoice_item, item: item, invoice: invoice)
     transaction   =  create(:transaction, invoice: invoice, result: "failed")
     transaction   =  create(:transaction, invoice: invoice)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(parsed_json).to eq(
     "id"         => merchant_two.id,
     "name"       => merchant_two.name
    )
  end
end
