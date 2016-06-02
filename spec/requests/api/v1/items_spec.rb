require "rails_helper"


RSpec.describe "GET /api/v1/items" do
  it "returns all items" do
    item_one = create(:item)
    item_two = create(:item, name: "cat")

    get "/api/v1/items"

    expect(parsed_json.count).to eq(2)

    parsed_item = parsed_json.first

    expect(parsed_item).to eq(
    "id"           =>   item_one.id,
    "name"         =>   item_one.name,
    "description"  =>   item_one.description,
    "unit_price"   =>   item_one.unit_price,
    "merchant_id"  =>   item_one.merchant.id
    )
  end
end

RSpec.describe "GET /api/v1/items/:id" do
  it "returns a specific item" do
    item_one = create(:item)
    item_two = create(:item, name: "cat")

    get "/api/v1/items/#{item_one.id}"

    expect(parsed_json).to eq(
    "id"           =>   item_one.id,
    "name"         =>   item_one.name,
    "description"  =>   item_one.description,
    "unit_price"   =>   item_one.unit_price,
    "merchant_id"  =>   item_one.merchant.id
    )
  end
end
