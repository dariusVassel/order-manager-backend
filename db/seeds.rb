# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

organization1 = Organization.create(name: "Ganesh International", address: "Mumbai, India", email: "ganeshintnlmumbai@gmail.com")

user1 = organization1.users.create(username: "sumehr_gwalani", password: "withthetide_test", role: "admin")
user1_info = UserInfo.create(user_id: user1.id, first_name: "Sumehr", last_name: "Gwalani", email: "sumehr@ganeshinternational.com", phone: "+919619204292")

user2 = organization1.users.create(username: "santosh_ganesh", password: "withthetide_test", role: "employee")

organization2 = Organization.create(name: "Silver Seafood", address: "Mumbai, India", email: "samarth.gwalani94@gmail.com")

user3 = organization1.users.create(username: "samarth_gwalani", password: "withthetide_test", role: "admin")
user3_info = UserInfo.create(user_id: user3.id, first_name: "Samarth", last_name: "Gwalani", email: "samarth.gwalani94@gmail.com", phone: "+19172441354")

user4 = organization1.users.create(username: "sagar_silver", password: "withthetide_test", role: "employee")

item1 = Item.create(species_name: "Whole Cleaned Cuttlefish", scientific_name: "Sepiida", color: "White", physical_description: "")
item2 = Item.create(species_name: "Whole Squid", scientific_name: "Teuthida", color: "", physical_description: "")
item3 = Item.create(species_name: "Baby Squid", scientific_name: "Teuthida", color: "", physical_description: "")

order_item1= OrderItem.create(item_id: item1.id)

order1 = Order.create(order_status: "registered", po_number: 1000, order_item_id: order_item1.id, size: "20/40", glaze: "10", price_kg: 4.25, cartons: 835, packing: "6x1", kgs_carton: 6, payment_terms: "sight dp or lc at 75 days", port_to: "Valencia, Spain", port_from: "Pipavav, India", order_total: 21292.5, total_kilos: 5010, packing_specs: "printed bags", buyer_id: user1.id, seller_id: user3.id)

order_inquiry1 = OrderInquiry.create(item_id: item1.id, product_name: "Whole Cleaned Cuttlefish", quantity: 1000, packing: "10x1 kg", glaze: "20%", shipment_date: "2022-03-07", contact_name: "Silver")

#Add validations 
#Add error handling
#Add Mailers
#Add Serializers

puts("Done Seeding")