# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

shops = Shop.create( [ { name: 'The Tiara Shop', description: 'Quality tiaras since 1953.' },
                      { name: 'Tiara Express', description: 'The best selection of tiaras.' },
                      { name: 'Tiaras R Us', description: 'Hard to find children\'s tiaras.' },
                      { name: 'Estate Tiaras', description: 'Vintage, antique and hand made tiaras.' } ] )

products = Product.create ( [ { name: 'Tiara', description: 'Very sparkly!', price: 25, shop: Shop.first },
                              { name: 'Freshwater Pearl Tiara', description: 'Unique pearl tiara. Each one is hand made.', price: 75, shop: Shop.last },
                              { name: 'Basic Tiara', description: 'Plain tiara.', price: 8, shop: Shop.second } ] )

Plutus::Asset.create(:name => "Accounts Receivable")
Plutus::Revenue.create(:name => "Sales Revenue")
Plutus::Liability.create(:name => "Accounts Payable")
