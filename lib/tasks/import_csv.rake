require 'csv'


namespace :import do
  desc "Import customers from csv"
  task customers: :environment do
    CSV.foreach("db/csv/customers.csv", headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  desc "Import merchants from csv"
  task merchants: :environment do
    CSV.foreach("db/csv/merchants.csv", headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc "import items from csv"
  task items: :environment do
    CSV.foreach("db/csv/items.csv", headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  desc "import invoices from csv"
  task invoices: :environment do
    CSV.foreach("db/csv/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  desc "import invoice items from csv"
  task invoice_items: :environment do
    CSV.foreach("db/csv/invoice_items.csv", headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  desc "import transactions from csv"
  task transactions: :environment do
    CSV.foreach("db/csv/transactions.csv", headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end

  desc "import all csv's"
  task :all => [:customers, :merchants, :items, :invoices, :invoice_items, :transactions]
end

# def from_csv(filename, model)
#   CSV.foreach("db/csv/customers.csv", headers: true) do |row|
#     Customer.create(row.to_h)
# end
