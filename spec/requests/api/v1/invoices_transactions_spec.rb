require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/transactions" do
  it "returns the merchant associated with the item" do
    invoice  = create(:invoice)
    transaction = create(:transaction)
    transaction2 = create(:transaction, invoice: invoice)
    transaction3 = create(:transaction, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(parsed_json.count).to eq(2)

    parsed_transaction = parsed_json.first
    expect(parsed_transaction).to eq(
    "id"                   =>  transaction2.id,
    "invoice_id"           =>  transaction2.invoice.id,
    "credit_card_number"   =>  transaction2.credit_card_number,
    "result"               =>  transaction2.result
    )
  end
end
