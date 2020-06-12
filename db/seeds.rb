
#Delete old seeds before populating new seeds
User.delete_all
Vendor.delete_all
PriceList.delete_all

#Faker username seeds with same password (lolol)
5.times do
User.create(username: Faker::Hipster.unique.word, password: "lolol")
end

# Handmade vendor seeds
Vendor.create(user_id: User.first.id, name: "Segovia", description: "staple veg options", rep: "Joe", contact: "555-555-6666")
Vendor.create(user_id: User.first.id, name: "JBG Farms", description: "specialty local vegetables", rep: "Tim", contact: "555-555-5555")
Vendor.create(user_id: User.first.id, name: "Farm to Table", description: "backup vendor", rep: "Ruth", contact: "555-555-7777")

#user and vendor relationships
PriceList.create(user_id: User.first.id, vendor_id: Vendor.first.id, date: "2020-06-21")
PriceList.create(user_id: User.first.id, vendor_id: Vendor.second.id, date: "2020-05-23")
PriceList.create(user_id: User.first.id, vendor_id: Vendor.first.id, date: "2020-06-14")

PriceList.create(user_id: User.second.id, vendor_id: Vendor.first.id, date: "2020-02-10")
PriceList.create(user_id: User.second.id, vendor_id: Vendor.second.id, date: "2020-06-19")

PriceList.create(user_id: User.third.id, vendor_id: Vendor.third.id, date: "2020-04-11")
PriceList.create(user_id: User.third.id, vendor_id: Vendor.second.id, date: "2020-06-07")

PriceList.create(user_id: User.fourth.id, vendor_id: Vendor.second.id, date: "2020-05-16")
PriceList.create(user_id: User.fourth.id, vendor_id: Vendor.second.id, date: "2020-06-24")

PriceList.create(user_id: User.fifth.id, vendor_id: Vendor.first.id, date: "2020-04-11")
PriceList.create(user_id: User.fifth.id, vendor_id: Vendor.third.id, date: "2020-06-09")

#Items, mostly veggies
20.times do 
Item.create(name: Faker::Food.unique.vegetables)
end

5.times do
Item.create(name: Faker::Food.unique.ingredient)
end

#helper methods

def randomPL
    pls = PriceList.all
    pls.sample.id
end

def randomI
    i = Item.all
    i.sample.id
end

def randPrice
    p = rand(1.0..99.0).round(2)
    p
end

#item detail seeds
25.times do
ItemDetail.create(price_list_id: randomPL(), item_id: randomI(), pack_size: Faker::Food.metric_measurement, price: randPrice())
end