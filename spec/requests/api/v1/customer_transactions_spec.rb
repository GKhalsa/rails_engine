require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/transactions" do
  it "returns transactions belonging to the customer" do
    customer = create(:customer)
    invoice = create(:invoice)
    invoice.update(customer_id: customer.id)
    transaction1 = create(:transaction)
    invoice.transactions << create(:transaction)
    invoice.transactions <<  create(:transaction)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(parsed_json.count).to eq(2)
    transaction = customer.transactions.first

    parsed_transaction = parsed_json.first
    expect(parsed_transaction).to eq(
    "id"                   =>  transaction.id,
    "invoice_id"           =>  transaction.invoice.id,
    "credit_card_number"   =>  transaction.credit_card_number,
    "result"               =>  transaction.result
    )
  end
end
