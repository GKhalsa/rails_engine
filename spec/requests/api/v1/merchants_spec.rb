require "rails_helper"

RSpec.describe "GET /api/v1/merchants" do
  it "returns all merchants" do
    first_merchant  = create(:merchant)
    second_merchant = create(:merchant, name: "Peter")

    get "/api/v1/merchants"

    expect(parsed_json.count).to eq(2)

    parsed_merchant = parsed_json.first
    expect(parsed_merchant).to eq(
     "id"       => first_merchant.id,
     "name"     => first_merchant.name
    )
  end
end

RSpec.describe "GET /api/v1/merchants/:id" do
  it "returns a sigle merchant" do
    first_merchant  = create(:merchant)
    second_merchant = create(:merchant, name: "Peter")

    get "/api/v1/merchants/#{first_merchant.id}"

    expect(parsed_json).to eq(
     "id"       => first_merchant.id,
     "name"     => first_merchant.name
    )
  end
end
