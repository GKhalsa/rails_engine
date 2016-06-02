require "rails_helper"

RSpec.describe "GET /api/v1/transactions" do
  it "returns all transactions" do
    first_transaction  = create(:transaction)
    second_transaction = create(:transaction, result: "failed")

    get "/api/v1/transactions"

    expect(parsed_json.count).to eq(2)

    parsed_transaction = parsed_json.first
    expect(parsed_transaction).to eq(
    "id"                           => first_transaction.id,
    "invoice_id"                   => first_transaction.invoice_id,
    "credit_card_number"           => first_transaction.credit_card_number,
    "result"                       => first_transaction.result
    )
  end
end

RSpec.describe "GET /api/v1/transactions/:id" do
  it "returns a specific transaction" do
    first_transaction  = create(:transaction)
    second_transaction = create(:transaction, result: "failed")

    get "/api/v1/transactions/#{first_transaction.id}"

    expect(parsed_json).to eq(
    "id"                           => first_transaction.id,
    "invoice_id"                   => first_transaction.invoice_id,
    "credit_card_number"           => first_transaction.credit_card_number,
    "result"                       => first_transaction.result
    )
  end
end
