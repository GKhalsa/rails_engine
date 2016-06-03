require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/favorite_customer" do
  it "returns customer who completed most successful transactions" do
    customer_one   =  create(:customer)
    customer_two   =  create(:customer, first_name:"sunny")
    merchant_one   =  create(:merchant)
            item   =  create(:item)
         invoice   =  create(:invoice, merchant: merchant_one, customer: customer_two)
    invoice_item   =  create(:invoice_item, item: item, invoice: invoice)
     transaction   =  create(:transaction, invoice: invoice, result: "failed")
     transaction   =  create(:transaction, invoice: invoice)

    get "/api/v1/merchants/#{merchant_one.id}/favorite_customer"

    expect(parsed_json).to eq(
     "id"         => customer_two.id,
     "first_name" => customer_two.first_name,
     "last_name"  => customer_two.last_name
    )
  end
end
