require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/random" do
  it "will return a random instance of invoice_items" do
    invoice_item = create(:invoice_item)
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/random"

    expect(parsed_json.class).to eq(Hash)
  end
end
