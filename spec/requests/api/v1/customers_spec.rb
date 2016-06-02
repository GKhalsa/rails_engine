require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  it "returns all customers" do
    customer_one  = create(:customer)
    customer_two  = create(:customer, first_name: "Wesley")

    get "/api/v1/customers"
    expect(parsed_json.count).to eq(2)

    customer_one_to_json = parsed_json[0]

    expect(customer_one_to_json).to eq({
      "id"         => customer_one.id,
      "first_name" => "Gurusundesh",
      "last_name"  => "Khalsa",
    })
  end
end
