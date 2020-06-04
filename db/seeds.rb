
#Delete old seeds before populating new seeds
User.delete_all
Vendor.delete_all
PriceList.delete_all

#Faker username seeds with same password (lolol)
5.times do
User.create(username: Faker::Hipster.unique.word, password: "lolol")
end

# Handmade vendor seeds
Vendor.create(name: "Segovia", description: "staple veg options", rep: "Joe", contact: "joe@segovia.com")

Vendor.create(name: "JBG Farms", description: "specialty local vegetables", rep: "Tim", contact: "555-555-5555")

Vendor.create(name: "Farm to Table", description: "backup vendor", rep: "Ruth", contact: "ruth@ftt.com")

#user and vendor relationships
PriceList.create(user_id: User.first.id, vendor_id: Vendor.first.id, date: "03/04/2020")

