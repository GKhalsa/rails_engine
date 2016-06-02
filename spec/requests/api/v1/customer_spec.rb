require 'rails_helper'

RSpec.describe "GET /api/v1/customers/:id" do
  it "returns a specific customer" do
    customer_one  = create(:customer)
    customer_two  = create(:customer, first_name: "Wesley")

    get "/api/v1/customers/#{customer_one.id}"

    expect(parsed_json).to eq({
      "id"         => customer_one.id,
      "first_name" => customer_one.first_name,
      "last_name"  => customer_one.last_name,
    })
  end
end
