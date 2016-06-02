FactoryGirl.define do
  factory :customer do
    first_name   "Gurusundesh"
    last_name    "Khalsa"
  end

  factory :merchant do
    name "Horace"
  end

  factory :item do
    name         "name"
    description  "string"
    unit_price   1
    merchant
  end

  factory :invoice do
    customer
    merchant
    status     "approved"
  end

  factory :invoice_item do
    item
    invoice
    quantity    1
    unit_price  1
  end

  factory :transaction do
    invoice
    credit_card_number  "1234"
    credit_card_expiration_date "12345"
    result  "success"
  end
end
